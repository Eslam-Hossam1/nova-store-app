import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/core/widgets/padding/app_padding.dart';

class CustomPurpleTitleWithSeeAll extends StatelessWidget {
  const CustomPurpleTitleWithSeeAll({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AppPadding(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.bold19(context).copyWith(
                color: context.mainTextColor,
              ),
            ),
            GestureDetector(
              onTap: () => context.push(RoutePaths.category),
              child: Row(
                children: [
                  Text(
                    'See all',
                    style: AppTextStyles.bold15(context).copyWith(
                      color: context.secondaryTextColor,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12.w.clampLessQuarterAndMoreQuarter(12),
                    color: context.secondaryTextColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
