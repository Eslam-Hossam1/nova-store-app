import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/core/utils/constants.dart';
import 'package:nova_store_app/core/widgets/custom_cached_network_image.dart';
import 'package:nova_store_app/core/widgets/spacing/height_space.dart';
import 'package:nova_store_app/core/widgets/spacing/width_space.dart';
import 'package:nova_store_app/core/widgets/star_rating.dart';
import 'package:nova_store_app/features/home/presentation/widgets/favourite_icon_button.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
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
              Positioned(
                top: 8.h,
                left: 0,
                child: Container(
                  height: 20.h,
                  width: 47.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xffD23A3A), Color(0xffF49763)]),
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.r),
                      bottomRight: Radius.circular(40.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '-50%',
                      style: AppTextStyles.bold11(context).copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
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
        Row(
          children: [
            Text(
              '\$49',
              style: AppTextStyles.bold17(context).copyWith(
                color: Colors.red,
              ),
            ),
            WidthSpace(width: 5),
            Text(
              '\$99',
              style: AppTextStyles.regular17(context).copyWith(
                color: context.secondaryTextColor,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        )
      ],
    );
  }
}
