import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/api/api_keys.dart';
import 'package:nova_store_app/core/api/end_points.dart';
import 'package:nova_store_app/core/auth/auth_credentials_manager.dart';
import 'package:nova_store_app/core/helpers/dialog_helper.dart';
import 'package:nova_store_app/core/routing/app_router.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';

class ApiInterceptor extends Interceptor {
  final Dio client;
  final AuthCredentialsManager authCredentialsHelper;

  ApiInterceptor({
    required this.client,
    required this.authCredentialsHelper,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = authCredentialsHelper.accessToken;

    options.headers[ApiKeys.authorization] = "Bearer $token";
    options.headers[ApiKeys.client] = "not-browser";
    log(options.headers[ApiKeys.authorization]);
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');

    final isUnauthorized = err.response?.statusCode == 401;
    final isUserLoggedIn = authCredentialsHelper.userIsAuthenticated();
    final hasNotRetried = !(err.requestOptions.extra['retrying'] ?? false);
    final isRefreshRequest =
        err.requestOptions.path.contains(EndPoints.refreshToken);

    if (isRefreshRequest) {
      return handler.next(err);
    }

    if (isUnauthorized && isUserLoggedIn && hasNotRetried) {
      err.requestOptions.extra['retrying'] = true;

      try {
        final refreshed = await _refreshToken();
        if (refreshed) {
          final response = await _retry(err.requestOptions);
          return handler.resolve(response);
        } else {
          _handleSessionEnd();
          return; 
        }
      } catch (e) {
        log(e.toString());
        _handleSessionEnd();
        return; 
      }
    }

    super.onError(err, handler);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    
    final options = Options(
      method: requestOptions.method,
      extra: requestOptions.extra,
    );

    return client.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<bool> _refreshToken() async {
    try {
      final response = await client.post(EndPoints.refreshToken, data: {
        ApiKeys.refreshToken: "Bearer ${authCredentialsHelper.refreshToken}",
      });

      final tokens = response.data['tokens'];
      final newAccessToken = tokens[ApiKeys.accessToken] as String;
      final newRefreshToken = tokens[ApiKeys.refreshToken] as String;

      await authCredentialsHelper.storeTokens(
        accessToken: newAccessToken,
        refreshToken: newRefreshToken,
      );

      return true;
    } catch (e) {
      log('_refreshToken failed: $e');
      return false;
    }
  }

  void _handleSessionEnd() {
    authCredentialsHelper.clearTokens();

    final context = AppRouter.rootNavigatorKey.currentState?.context;
    if (context != null) {
      DialogHelper.showEndSessionDialog(
        context,
        onDismissCallback: (_) => context.go(RoutePaths.login),
        btnOkOnPress: () => context.go(RoutePaths.login),
      );
    }
  }
}
