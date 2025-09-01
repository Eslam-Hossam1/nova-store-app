import 'package:flutter/material.dart';
import 'package:nova_store_app/core/widgets/Custom_text_button.dart';

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
          // Proceed with the Login logic
        } else {
          enableAutoValidation();
        }
      },
    );
  }
}
