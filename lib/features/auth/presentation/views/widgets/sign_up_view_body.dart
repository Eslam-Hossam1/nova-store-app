import 'package:flutter/material.dart';
import 'package:nova_store_app/features/auth/presentation/views/widgets/auth_app_bar.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        AuthAppBar(
          title: 'Sign Up',
        )
      ],
    );
  }
}
