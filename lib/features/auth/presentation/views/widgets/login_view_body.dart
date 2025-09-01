import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/utils/spacing.dart';
import 'package:nova_store_app/features/auth/presentation/views/widgets/auth_app_bar.dart';
import 'package:nova_store_app/features/auth/presentation/views/widgets/dont_have_an_account.dart';
import 'package:nova_store_app/features/auth/presentation/views/widgets/enter_email_section.dart';
import 'package:nova_store_app/features/auth/presentation/views/widgets/login_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
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
          AuthAppBar(title: 'Login'),
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
                    LoginButton(
                      formKey: formKey,
                      enableAutoValidation: enableAutoValidation,
                    ),
                    verticalSpace(16.h),
                    DontHaveAnyAccount(),
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
