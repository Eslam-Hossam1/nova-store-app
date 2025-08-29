import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/utils/spacing.dart';
import 'package:nova_store_app/features/auth/presentation/views/widgets/already_have_an_account.dart';
import 'package:nova_store_app/features/auth/presentation/views/widgets/auth_app_bar.dart';
import 'package:nova_store_app/features/auth/presentation/views/widgets/enter_email_section.dart';
import 'package:nova_store_app/features/auth/presentation/views/widgets/sign_up_button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void enableAutoValidation() {
    autovalidateMode = AutovalidateMode.always;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: CustomScrollView(
        slivers: [
          AuthAppBar(title: 'Sign Up'),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            sliver: EnterEmailSection(),
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
                    SignUpButton(
                      formKey: formKey,
                      enableAutoValidation: enableAutoValidation,
                    ),
                    verticalSpace(16.h),
                    AlreadyHaveAccount(),
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
