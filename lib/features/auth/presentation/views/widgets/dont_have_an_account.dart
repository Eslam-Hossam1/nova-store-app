import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';
import 'package:nova_store_app/core/theming/app_colors.dart';
import 'package:nova_store_app/core/theming/app_text_styles.dart';
import 'package:nova_store_app/core/widgets/clickable_text.dart';

class DontHaveAnyAccount extends StatelessWidget {
  const DontHaveAnyAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have any account? ",
          style: AppTextStyles.bold15(context).copyWith(
            color: AppColors.darkGray,
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
            color: AppColors.lightPurple,
          ),
        ),
      ],
    );
  }
}
