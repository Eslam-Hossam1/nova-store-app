import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';
import 'package:nova_store_app/features/profile/presentation/views/profile_view.dart';

class ProfileRoutes {
  static GoRoute profile = GoRoute(
    path: RoutePaths.profile,
    builder: (context, state) => const ProfileView(),
  );

  static List<GoRoute> routes = [
    profile,
  ];
}
