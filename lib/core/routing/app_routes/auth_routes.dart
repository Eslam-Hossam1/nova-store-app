import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';

class AuthRoutes {
  static GoRoute signUp = GoRoute(
    path: RoutePaths.signUp,
    builder: (context, state) => const Scaffold(
      body: Center(child: Text('Sign Up View')),
    ),
  );

  static List<GoRoute> routes = [
    signUp,
  ];
}
