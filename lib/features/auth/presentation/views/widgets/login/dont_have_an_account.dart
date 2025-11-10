import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/core/widgets/clickable_text.dart';
import 'package:nova_store_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';

class DontHaveAnyAccount extends StatelessWidget {
  const DontHaveAnyAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is LoginLoading,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have any account? ",
                style: AppTextStyles.bold15(context).copyWith(
                  color: context.secondaryTextColor,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              ClickableText(
                onTap: () {
                  context.go(RoutePaths.signUp);
                },
                text: 'Sign Up',
                style: AppTextStyles.bold15(context).copyWith(
                  color: context.primaryColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
