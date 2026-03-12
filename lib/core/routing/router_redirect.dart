import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/auth/auth_credentials_manager.dart';
import 'package:nova_store_app/core/helpers/on_boarding_cache_helper.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';

class RouterRedirect {
  final OnBoardingCacheHelper _onBoardingCacheHelper;
  final AuthCredentialsManager _authCredentialsManager;

  const RouterRedirect({
    required OnBoardingCacheHelper onBoardingCacheHelper,
    required AuthCredentialsManager authCredentialsManager,
  })  : _onBoardingCacheHelper = onBoardingCacheHelper,
        _authCredentialsManager = authCredentialsManager;

  String? redirect(BuildContext context, GoRouterState state) {
    logInfos(state);

    bool isAppJustOpenedNormally =
        state.matchedLocation == RoutePaths.initialRoute;

    if (isAppJustOpenedNormally) {
      return determineInitialView();
    } else {
      return null;
    }
  }

  void logInfos(GoRouterState state) {
    log('location: ${state.uri.path}');
    log('uri: ${state.uri}');
    log('pathSegments: ${state.uri.pathSegments}');
    log('queryParameters: ${state.uri.queryParameters}');
  }

  String determineInitialView() {
    if (!_onBoardingCacheHelper.isOnBoardingCompleted()) {
      return RoutePaths.onboarding;
    } else {
      return _authCredentialsManager.userIsAuthenticated()
          ? RoutePaths.home
          : RoutePaths.login;
    }
  }
}
