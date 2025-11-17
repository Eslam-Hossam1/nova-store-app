import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';
import 'package:nova_store_app/features/category/presentation/views/category_view.dart';

class CategoryRoute {
  static GoRoute category = GoRoute(
    path: RoutePaths.category,
    builder: (context, state) {
      return CategoryView();
    },
  );

  static List<GoRoute> routes = [category];
}
