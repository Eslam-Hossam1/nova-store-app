import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';
import 'package:nova_store_app/features/auth/presentation/views/sign_up_view.dart';

class AuthRoutes {
  static GoRoute signUp = GoRoute(
    path: RoutePaths.signUp,
    builder: (context, state) => const SignUpView()
  );

  static List<GoRoute> routes = [
    signUp,
  ];
}
