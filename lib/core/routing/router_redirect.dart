import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/helpers/on_boarding_cache_helper.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';

class RouterRedirect {
  final OnBoardingCacheHelper _onBoardingCacheHelper;
  const RouterRedirect({required OnBoardingCacheHelper onBoardingCacheHelper})
      : _onBoardingCacheHelper = onBoardingCacheHelper;

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
      //check if user is logged in or not
      //for now we will always return sign-up
      return RoutePaths.signUp;
    }
  }
}
