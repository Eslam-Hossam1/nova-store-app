import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/features/product-details/domain/entities/product_comment_entity.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/all_reviews/rating_bar.dart';

class ReviewsStatsHeader extends StatelessWidget {
  const ReviewsStatsHeader({
    super.key,
    required this.reviewCount,
    required this.averageRating,
    required this.comments,
  });

  final int reviewCount;
  final double averageRating;
  final List<ProductCommentEntity> comments;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 20.h),
        child: Row(
          children: [
            // Big average score
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  averageRating.toStringAsFixed(1),
                  style: AppTextStyles.bold25(context).copyWith(
                    color: context.primaryColor,
                    fontSize: 40.sp.clamp(32, 48),
                    height: 1,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '$reviewCount ${reviewCount == 1 ? 'review' : 'reviews'}',
                  style: AppTextStyles.regular12(context).copyWith(
                    color: context.secondaryTextColor,
                  ),
                ),
              ],
            ),
            SizedBox(width: 16.w),
            Container(
              width: 1,
              height: 48.h,
              color: context.outlineColor.withOpacity(0.3),
            ),
            SizedBox(width: 16.w),
            // Star breakdown bars
            Expanded(
              child: Column(
                children: List.generate(5, (i) {
                  final star = 5 - i;
                  final count = _countForStar(star);
                  final ratio = reviewCount == 0 ? 0.0 : count / reviewCount;
                  return RatingBar(
                    star: star,
                    ratio: ratio,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _countForStar(int star) =>
      comments.where((comment) => comment.rate.round() == star).length;
}
