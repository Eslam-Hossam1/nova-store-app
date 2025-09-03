import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/utils/spacing.dart';
import 'package:nova_store_app/core/widgets/rounded_app_bar.dart';
import 'package:nova_store_app/features/otp/presentation/views/widgets/enter_otp_section.dart';
import 'package:nova_store_app/features/otp/presentation/views/widgets/resend_code/resend_button_builder.dart';
import 'package:nova_store_app/features/otp/presentation/views/widgets/verify_button.dart';

class OtpViewBody extends StatefulWidget {
  const OtpViewBody({super.key});

  @override
  State<OtpViewBody> createState() => _OtpViewBodyState();
}

class _OtpViewBodyState extends State<OtpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void enableAutoValidation() {
    setState(() {
      autovalidateMode = AutovalidateMode.always;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: CustomScrollView(
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
                    VerifyButton(
                      enableAutoValidation: enableAutoValidation,
                      formKey: formKey,
                    ),
                    verticalSpace(16.h),
                    ResendButtonBuilder()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
