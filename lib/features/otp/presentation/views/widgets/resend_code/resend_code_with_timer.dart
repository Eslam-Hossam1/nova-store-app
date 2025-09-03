import 'package:flutter/material.dart';
import 'package:nova_store_app/core/theme/app_colors.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/features/otp/presentation/views/widgets/resend_code/count_down_timer.dart';

class ResendCodeWithTimer extends StatelessWidget {
  const ResendCodeWithTimer({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = AppTextStyles.semiBold14(context).copyWith(
      color: AppColors.gray,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Resend code on email in ', style: textStyle),
        CountdownTimer(
          seconds: 15,
          timertextStyle: textStyle,
        ),
      ],
    );
  }
}
