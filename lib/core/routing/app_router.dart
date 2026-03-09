import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/di/service_locator.dart';
import 'package:nova_store_app/core/helpers/on_boarding_cache_helper.dart';
import 'package:nova_store_app/core/routing/app_routes/all_routs.dart';
import 'package:nova_store_app/core/routing/router_redirect.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final routerRedirect = RouterRedirect(
    onBoardingCacheHelper: getIt<OnBoardingCacheHelper>(),
  );
  static final router = GoRouter(
    initialLocation: RoutePaths.login,
    navigatorKey: rootNavigatorKey,
    redirect: routerRedirect.redirect,
    debugLogDiagnostics: true,
    routes: AppRoutes.routes,
  );
}
