import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/routing/app_routes/all_reviews_route.dart';
import 'package:nova_store_app/core/routing/app_routes/auth_routes.dart';
import 'package:nova_store_app/core/routing/app_routes/category_route.dart';
import 'package:nova_store_app/core/routing/app_routes/home_route.dart';
import 'package:nova_store_app/core/routing/app_routes/onboarding_route.dart';
import 'package:nova_store_app/core/routing/app_routes/otp_route.dart';
import 'package:nova_store_app/core/routing/app_routes/product_details_route.dart';
import 'package:nova_store_app/core/routing/app_routes/profile_routes.dart';

class AppRoutes {
  static List<RouteBase> routes = [
    ...OnboardingRoute.routes,
    ...AuthRoutes.routes,
    ...OtpRoute.routes,
    HomeRoute.home,
    CategoryRoute.category,
    ProductDetailsRoute.productDetails,
    ...ProfileRoutes.routes,
    AllReviewsRoute.allReviews,
  ];
}
