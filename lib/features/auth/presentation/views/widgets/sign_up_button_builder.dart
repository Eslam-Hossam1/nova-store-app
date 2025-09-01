import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/widgets/custom_loading_button.dart';
import 'package:nova_store_app/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:nova_store_app/features/auth/presentation/views/widgets/sign_up_button.dart';

class SignUpButtonBuilder extends StatelessWidget {
  const SignUpButtonBuilder({
    super.key,
    required this.formKey,
    required this.enableAutoValidation,
  });
  final GlobalKey<FormState> formKey;
  final void Function() enableAutoValidation;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is SignUpLoading,
          child: state is SignUpLoading
              ? const CustomLoadingButton()
              : SignUpButton(
                  enableAutoValidation: enableAutoValidation,
                  formKey: formKey,
                ),
        );
      },
    );
  }
}
