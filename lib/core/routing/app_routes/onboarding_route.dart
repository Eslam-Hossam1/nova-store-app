
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';

class OnboardingRoute {
  static GoRoute onboarding = GoRoute(
    path: RoutePaths.onboarding,
    builder: (context, state) => const Scaffold(
      body: Center(
        child: Text('Onboarding Screen'),
      ),
    ),
  );

  static List<GoRoute> routes = [
    onboarding,
  ];
}
