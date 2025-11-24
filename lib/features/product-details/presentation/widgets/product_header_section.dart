import 'package:flutter/material.dart';
import 'package:nova_store_app/core/theme/app_colors.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/core/widgets/spacing/height_space.dart';
import 'package:nova_store_app/core/widgets/spacing/width_space.dart';
import 'package:nova_store_app/core/widgets/star_rating.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_details_sections_background_container.dart';

class ProductHeaderSection extends StatelessWidget {
  const ProductHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProductDetailsSectionsBackgroundContainer(
      applyTopPadding: false,
      applyTopRadius: false,
      applyBottomPadding: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeightSpace(height: 14),
          Row(
            children: [
              StarRating(rating: 4.5),
              WidthSpace(width: 6),
              Text(
                '8 reviews',
                style: AppTextStyles.regular14(context).copyWith(
                  color: Color(0xff605A65),
                ),
              ),
              const Spacer(),
              Text(
                'In Stock',
                style: AppTextStyles.bold12(context).copyWith(
                  color: AppColors.green,
                ),
              ),
            ],
          ),
          HeightSpace(height: 12),
          Text(
            'Astylish Women Open Front Long Sleeve Chunky Knit Cardigan',
            style: AppTextStyles.regular17(context)
                .copyWith(color: context.mainTextColor),
          ),
          HeightSpace(height: 12),
          Text(
            '\$85',
            style: AppTextStyles.bold22(context)
                .copyWith(color: context.primaryColor),
          ),
          HeightSpace(height: 16),
        ],
      ),
    );
  }
}
