import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';
import 'package:nova_store_app/features/onboarding/presentation/views/onboarding_view.dart';

class OnboardingRoute {
  static GoRoute onboarding = GoRoute(
    path: RoutePaths.onboarding,
    builder: (context, state) => const OnboardingView(),
  );

  static List<GoRoute> routes = [
    onboarding,
  ];
}
