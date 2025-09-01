import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/widgets/Custom_text_button.dart';
import 'package:nova_store_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.enableAutoValidation,
    required this.formKey,
  });
  final GlobalKey<FormState> formKey;
  final void Function() enableAutoValidation;

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      width: double.infinity,
      text: 'Login',
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          context.read<LoginCubit>().login();
        } else {
          enableAutoValidation();
        }
      },
    );
  }
}
