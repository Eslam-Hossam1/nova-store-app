import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/di/service_locator.dart';
import 'package:nova_store_app/core/entities/category_entity.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';
import 'package:nova_store_app/core/utils/constants.dart';
import 'package:nova_store_app/features/category/domain/usecases/get_category_products_usecase.dart';
import 'package:nova_store_app/features/category/presentation/manager/category_products/category_products_cubit.dart';
import 'package:nova_store_app/features/category/presentation/views/category_view.dart';

class CategoryRoute {
  static GoRoute category = GoRoute(
    path: RoutePaths.category,
    builder: (context, state) {
      CategoryEntity categoryEntity = CategoryEntity(
        id: '6917d69fba52743fe2c2a64f',
        name: 'Richard Abass Waterson',
        image: Constants.categoryImageUrlTest,
      );

      return BlocProvider(
        create: (context) => CategoryProductsCubit(
          categoryEntity: categoryEntity,
          getCategoryProductsUseCase: getIt<GetCategoryProductsUseCase>(),
        )..firstFetchProducts(),
        child: CategoryView(),
      );
    },
  );

  static List<GoRoute> routes = [category];
}
