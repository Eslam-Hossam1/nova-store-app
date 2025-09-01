import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/helpers/dialog_helper.dart';
import 'package:nova_store_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:nova_store_app/features/auth/presentation/views/widgets/login/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
          //Todo: navigate to verify email screen
        }
      },
      child: Scaffold(
      body: LoginViewBody(),
    ),
    );
  }
}
