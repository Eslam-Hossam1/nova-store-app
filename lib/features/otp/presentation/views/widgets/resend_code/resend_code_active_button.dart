import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/features/otp/presentation/manager/cubit/otp_cubit.dart';

class ResendCodeActiveButton extends StatelessWidget {
  const ResendCodeActiveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<OtpCubit>().resendVerificationCode();
      },
      child: Text(
        'Resend code via email',
        style: AppTextStyles.semiBold14(context).copyWith(
          color: Color(0xff3866DF),
        ),
      ),
    );
  }
}
