import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/helpers/dialog_helper.dart';
import 'package:nova_store_app/core/mixins/no_internet_mixin.dart';
import 'package:nova_store_app/core/routing/routing_helper.dart';
import 'package:nova_store_app/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:nova_store_app/features/auth/presentation/views/widgets/sign_up/sign_up_view_body.dart';
import 'package:nova_store_app/features/otp/data/models/auth_otp/auth_otp_reason.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> with NoInternetMixin {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          DialogHelper.showErrorDialog(
            context,
            errorMessage: state.errMsg,
          );
        } else if (state is SignUpSuccess) {
            RoutingHelper.pushOtp(
            context,
            otpReason: AuthOtpReason(
              email: context.read<SignUpCubit>().email,
            ),
          );
        }
      },
      child: Scaffold(
        body: SignUpViewBody(),
      ),
    );
  }
}
