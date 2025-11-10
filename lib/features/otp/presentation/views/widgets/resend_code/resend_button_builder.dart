import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/features/otp/presentation/manager/cubit/otp_cubit.dart';
import 'package:nova_store_app/features/otp/presentation/views/widgets/resend_code/resend_code_active_button.dart';
import 'package:nova_store_app/features/otp/presentation/views/widgets/resend_code/resend_code_with_timer.dart';

class ResendButtonBuilder extends StatelessWidget {
  const ResendButtonBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpCubit, OtpState>(
      buildWhen: (previous, current) =>
          current is OtpInitial ||
          current is OtpShowResendButton ||
          current is ReSendOtpSuccess,
      builder: (context, state) {
        if (state is OtpShowResendButton) {
          return ResendCodeActiveButton();
        } else {
          return ResendCodeWithTimer();
        }
      },
    );
  }
}
