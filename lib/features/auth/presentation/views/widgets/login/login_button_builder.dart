import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/widgets/custom_loading_button.dart';
import 'package:nova_store_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:nova_store_app/features/auth/presentation/views/widgets/login/login_button.dart';

class LoginButtonBuilder extends StatelessWidget {
  const LoginButtonBuilder({
    super.key,
    required this.formKey,
    required this.enableAutoValidation,
  });
  final GlobalKey<FormState> formKey;
  final void Function() enableAutoValidation;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is LoginLoading,
          child: state is LoginLoading
              ? const CustomLoadingButton()
              : LoginButton(
                  enableAutoValidation: enableAutoValidation,
                  formKey: formKey,
                ),
        );
      },
    );
  }
}
