import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_details_sections_title.dart';

class ProductDetailsSectionsTitleWithSeeAll extends StatelessWidget {
  const ProductDetailsSectionsTitleWithSeeAll({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          ProductDetailsSectionsTitle(title: title),
          const Spacer(),
          Row(
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
        ],
      ),
    );
  }
}
