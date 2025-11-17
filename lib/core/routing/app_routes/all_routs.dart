import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/routing/app_routes/auth_routes.dart';
import 'package:nova_store_app/core/routing/app_routes/category_route.dart';
import 'package:nova_store_app/core/routing/app_routes/home_route.dart';
import 'package:nova_store_app/core/routing/app_routes/onboarding_route.dart';
import 'package:nova_store_app/core/routing/app_routes/otp_route.dart';

class AppRoutes {
  static List<RouteBase> routes = [
    ...OnboardingRoute.routes,
    ...AuthRoutes.routes,
    ...OtpRoute.routes,
    HomeRoute.home,
    CategoryRoute.category,
  ];
}
