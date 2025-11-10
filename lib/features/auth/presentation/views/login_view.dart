import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/helpers/dialog_helper.dart';
import 'package:nova_store_app/core/mixins/no_internet_mixin.dart';
import 'package:nova_store_app/core/routing/routing_helper.dart';
import 'package:nova_store_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:nova_store_app/features/auth/presentation/views/widgets/login/login_view_body.dart';
import 'package:nova_store_app/features/otp/data/models/auth_otp/auth_otp_reason.dart';

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
        } else if (state is LoginSuccess) {
          RoutingHelper.pushOtp(
            context,
            otpReason: AuthOtpReason(
              email: context.read<LoginCubit>().email,
            ),
          );
        }
      },
      child: Scaffold(
        body: LoginViewBody(),
      ),
    );
  }
}
