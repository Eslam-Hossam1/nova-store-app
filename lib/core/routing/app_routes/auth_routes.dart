import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/di/service_locator.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';
import 'package:nova_store_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:nova_store_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:nova_store_app/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:nova_store_app/features/auth/presentation/views/login_view.dart';
import 'package:nova_store_app/features/auth/presentation/views/sign_up_view.dart';

class AuthRoutes {
  static GoRoute signUp = GoRoute(
    path: RoutePaths.signUp,
    builder: (context, state) => BlocProvider(
      create: (context) => SignUpCubit(
        signUpUsecase: SignUpUsecase(
          authRepo: getIt<AuthRepoImpl>(),
        ),
      ),
      child: const SignUpView(),
    ),
  );
  static GoRoute login = GoRoute(
      path: RoutePaths.login, builder: (context, state) => const LoginView());

  static List<GoRoute> routes = [
    signUp,
    login,
  ];
}
