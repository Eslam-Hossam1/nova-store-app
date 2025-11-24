import 'package:flutter/material.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/core/widgets/padding/app_padding.dart';

class CustomPurpleTitle extends StatelessWidget {
  const CustomPurpleTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AppPadding(
        child: Row(
          children: [
            Text(
              title,
              style: AppTextStyles.bold19(context).copyWith(
                color: context.mainTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
