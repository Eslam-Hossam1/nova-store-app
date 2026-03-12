import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/di/service_locator.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';
import 'package:nova_store_app/features/product-details/domain/usecases/get_product_comments_usecase.dart';
import 'package:nova_store_app/features/product-details/presentation/manager/manager/all_reviews_cubit/all_reviews_cubit.dart';
import 'package:nova_store_app/features/product-details/presentation/views/all_reviews_view.dart';

class AllReviewsRoute {
  static GoRoute allReviews = GoRoute(
    path: RoutePaths.allReviews,
    builder: (context, state) {
      final productId = state.pathParameters['productId']!;
      return BlocProvider(
        create: (context) => AllReviewsCubit(
          getProductCommentsUseCase: getIt<GetProductCommentsUseCase>(),
          productId: productId,
        )..getProductComments(),
        child: const AllReviewsView(),
      );
    },
  );

  static List<GoRoute> routes = [
    allReviews,
  ];
}
