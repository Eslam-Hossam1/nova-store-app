import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';
import 'package:nova_store_app/features/product-details/presentation/views/product_details_view.dart';

class ProductDetailsRoute {
  static GoRoute productDetails = GoRoute(
    path: RoutePaths.productDetails,
    builder: (context, state) {
      return ProductDetailsView();
    },
  );

  static List<GoRoute> routes = [productDetails];
}
