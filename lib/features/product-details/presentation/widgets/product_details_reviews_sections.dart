
import 'package:flutter/material.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/core/widgets/spacing/height_space.dart';
import 'package:nova_store_app/core/widgets/star_rating.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_details_section/product_details_extendable_text.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_details_sections_background_container.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_details_sections_title_with_see_all.dart';

class ProductDetailsReviewsSection extends StatelessWidget {
  const ProductDetailsReviewsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProductDetailsSectionsBackgroundContainer(
      applyBottomPadding: false,
      child: Column(
        children: [
         const ProductDetailsSectionsTitleWithSeeAll(title: 'Reviews'),
          const HeightSpace(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Olha Chabanova',
                style: AppTextStyles.semiBold14(context).copyWith(
                  color: context.mainTextColor,
                ),
              ),
              const HeightSpace(height: 8),
              Row(
                children: [
                  StarRating(rating: 4.5),
                  const Spacer(),
                  Text(
                    'June 5,2021',
                    style: AppTextStyles.bold12(context).copyWith(
                      color: context.mainTextColor,
                    ),
                  ),
                ],
              )
            ],
          ),
          const HeightSpace(height: 16),
          ProductDetailsExtendableText(),
        ],
      ),
    );
  }
}
