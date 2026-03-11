import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/core/widgets/custom_cached_network_image.dart';
import 'package:nova_store_app/core/widgets/spacing/height_space.dart';
import 'package:nova_store_app/core/widgets/star_rating.dart';
import 'package:nova_store_app/features/home/domain/entities/product_entity.dart';
import 'package:nova_store_app/features/home/presentation/widgets/favourite_icon_button.dart';
import 'package:nova_store_app/features/home/presentation/widgets/product_item/discount_badge.dart';
import 'package:nova_store_app/features/home/presentation/widgets/product_item/product_price_section.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(
        RoutePaths.productDetailsPath(productEntity.id),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    width: double.infinity,
                    url: productEntity.images.first,
                  ),
                ),
                Positioned(
                  top: 8.h,
                  left: 0,
                  child: DiscountBadge(productEntity: productEntity),
                ),
                Positioned(
                  right: 8.h,
                  bottom: -16.w.clampLessEighthAndMoreEighth(16),
                  child: FavouriteIconButton(),
                ),
              ],
            ),
          ),
          HeightSpace(height: 8),
          StarRating(rating: productEntity.rateProduct.toDouble()),
          HeightSpace(height: 8),
          Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            productEntity.name,
            style: AppTextStyles.regular17(context).copyWith(
              color: context.mainTextColor,
            ),
          ),
          HeightSpace(height: 8),
          ProductPriceSection(productEntity: productEntity)
        ],
      ),
    );
  }
}
