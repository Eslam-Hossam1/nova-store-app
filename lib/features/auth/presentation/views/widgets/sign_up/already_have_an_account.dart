import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';
import 'package:nova_store_app/core/theme/app_colors.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/widgets/clickable_text.dart';
import 'package:nova_store_app/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is SignUpLoading,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account! ',
                style: AppTextStyles.bold15(context).copyWith(
                  color: AppColors.darkGray,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              ClickableText(
                onTap: () {
                  context.go(RoutePaths.login);
                },
                text: 'Login',
                style: AppTextStyles.bold15(context).copyWith(
                  color: AppColors.lightPurple,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
