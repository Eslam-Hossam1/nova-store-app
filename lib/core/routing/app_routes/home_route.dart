import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/di/service_locator.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';
import 'package:nova_store_app/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:nova_store_app/features/home/presentation/manager/category_cubit/category_cubit.dart';
import 'package:nova_store_app/features/home/presentation/views/home_view.dart';

class HomeRoute {
  static GoRoute home = GoRoute(
    path: RoutePaths.home,
    builder: (context, state) => BlocProvider(
      create: (context) => CategoryCubit(
        getCategoriesUseCase: getIt<GetCategoriesUseCase>(),
      )..getCategories(),
      child: const HomeView(),
    ),
  );

  static List<GoRoute> routes = [
    home,
  ];
}
