import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/utils/spacing.dart';
import 'package:nova_store_app/core/widgets/rounded_app_bar.dart';
import 'package:nova_store_app/features/otp/presentation/views/widgets/enter_otp_section.dart';
import 'package:nova_store_app/features/otp/presentation/views/widgets/verify_button.dart';

class OtpViewBody extends StatelessWidget {
  const OtpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        RoundedAppBar(title: 'Verification Code'),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          sliver: EnterOtpSection(),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 50.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  VerifyButton(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
