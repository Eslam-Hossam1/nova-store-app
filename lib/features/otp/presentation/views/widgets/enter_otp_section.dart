
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/theme/app_colors.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/widgets/custom_pin_code_field.dart';

class EnterOtpSection extends StatelessWidget {
  const EnterOtpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60.h),
          Text(
            'Please enter verification code sent to',
            style: AppTextStyles.regular17(context).copyWith(
              color: AppColors.darkPurple,
            ),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'your email: ',
                style: AppTextStyles.regular17(context).copyWith(
                  color: AppColors.darkPurple,
                ),
              ),
              TextSpan(
                text: 'eslamhossam.tech@gmail.com',
                style: AppTextStyles.regular14(context).copyWith(
                  color: AppColors.darkPurple,
                ),
              )
            ]),
          ),
          SizedBox(height: 32.h),
          CustomPinCodeField(),
        ],
      ),
    );
    ;
  }
}
