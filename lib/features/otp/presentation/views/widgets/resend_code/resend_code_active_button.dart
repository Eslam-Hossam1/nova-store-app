import 'package:flutter/material.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';

class ResendCodeActiveButton extends StatelessWidget {
  const ResendCodeActiveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        'Resend code via email',
        style: AppTextStyles.semiBold14(context).copyWith(
          color: Color(0xff3866DF),
        ),
      ),
    );
  }
}
