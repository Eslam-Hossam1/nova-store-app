import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/di/service_locator.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';
import 'package:nova_store_app/features/product-details/domain/usecases/add_comment_usecase.dart';
import 'package:nova_store_app/features/product-details/domain/usecases/get_product_details_usecase.dart';
import 'package:nova_store_app/features/product-details/presentation/manager/manager/add_comment_cubit/add_comment_cubit.dart';
import 'package:nova_store_app/features/product-details/presentation/manager/manager/product_details_cubit/product_details_cubit.dart';
import 'package:nova_store_app/features/product-details/presentation/views/product_details_view.dart';

class ProductDetailsRoute {
  static GoRoute productDetails = GoRoute(
    path: RoutePaths.productDetails,
    builder: (context, state) {
      const String productId = "6918dd4d2bbbcaedbc8105aa";
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ProductDetailsCubit(
              getProductDetailsUseCase: getIt<GetProductDetailsUseCase>(),
              productId: productId,
            )..getProductDetails(),
          ),
          BlocProvider(
            create: (_) => AddCommentCubit(
              addCommentUseCase: getIt<AddCommentUseCase>(),
            ),
          ),
        ],
        child: ProductDetailsView(),
      );
    },
  );

  static List<GoRoute> routes = [productDetails];
}
