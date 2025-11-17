import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';
import 'package:nova_store_app/features/home/presentation/views/home_view.dart';

class HomeRoute {
  static GoRoute home = GoRoute(
    path: RoutePaths.home,
    builder: (context, state) => const HomeView(),
  );

  static List<GoRoute> routes = [
    home,
  ];
}
