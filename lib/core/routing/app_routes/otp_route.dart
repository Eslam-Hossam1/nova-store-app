import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';

class OtpRoute {
  static GoRoute otp = GoRoute(
    path: RoutePaths.otp,
    builder: (context, state) => const Scaffold(
      body: Center(child: Text('OTP view'),),
    ),
  );

  static List<GoRoute> routes = [
    otp,
  ];
}
