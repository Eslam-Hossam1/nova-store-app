import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/core/utils/constants.dart';
import 'package:nova_store_app/core/widgets/custom_cached_network_image.dart';
import 'package:nova_store_app/core/widgets/spacing/height_space.dart';
import 'package:nova_store_app/core/widgets/star_rating.dart';
import 'package:nova_store_app/features/home/presentation/widgets/favourite_icon_button.dart';
import 'package:nova_store_app/features/home/presentation/widgets/product_item/discount_badge.dart';
import 'package:nova_store_app/features/home/presentation/widgets/product_item/product_price_section.dart';

class SimilarProductItem extends StatelessWidget {
  const SimilarProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CustomCachedNetworkImage(
                  height: double.infinity,
                  url: Constants.categoryImageUrlTest,
                ),
              ),
              // Positioned(
              //   top: 8.h,
              //   left: 0,
              //   child: DiscountBadge(),
              // ),
              Positioned(
                right: 8.h,
                bottom: -16.w.clampLessEighthAndMoreEighth(16),
                child: FavouriteIconButton(),
              ),
            ],
          ),
        ),
        HeightSpace(height: 8),
        StarRating(rating: 3.5),
        HeightSpace(height: 8),
        Text(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          'Saodimallsu Womens Turtleneck Oversized...',
          style: AppTextStyles.regular14(context).copyWith(
            color: context.mainTextColor,
          ),
        ),
        HeightSpace(height: 8),
        //ProductPriceSection()
      ],
    );
  }
}
