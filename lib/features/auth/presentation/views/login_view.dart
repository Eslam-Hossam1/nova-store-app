import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/helpers/dialog_helper.dart';
import 'package:nova_store_app/core/mixins/no_internet_mixin.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';
import 'package:nova_store_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:nova_store_app/features/auth/presentation/views/widgets/login/login_view_body.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with NoInternetMixin {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          DialogHelper.showErrorDialog(
            context,
            errorMessage: state.errMsg,
          );
        }else if (state is LoginSuccess) {
          context.push(RoutePaths.otp);
        }
      },
      child: Scaffold(
      body: LoginViewBody(),
    ),
    );
  }
}
