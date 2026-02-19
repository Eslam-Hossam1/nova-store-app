import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/widgets/custom_text_button.dart';
import 'package:nova_store_app/features/otp/presentation/manager/cubit/otp_cubit.dart';

class VerifyButton extends StatelessWidget {
  const VerifyButton({
    super.key,
    required this.formKey,
    required this.enableAutoValidation,
  });
  final GlobalKey<FormState> formKey;
  final void Function() enableAutoValidation;

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      text: 'Verifiy',
      width: double.infinity,
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          context.read<OtpCubit>().verfiyVerificationCode();
        } else {
          enableAutoValidation();
        }
      },
    );
  }
}
