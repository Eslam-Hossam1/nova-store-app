import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/routing/app_routes/all_routs.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    initialLocation: RoutePaths.onboarding,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: AppRoutes.routes,
  );
}
