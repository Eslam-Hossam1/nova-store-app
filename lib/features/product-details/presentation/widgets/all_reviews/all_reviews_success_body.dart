import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/theme/app_colors.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/features/product-details/domain/entities/product_comment_entity.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/all_reviews/all_review_item.dart';

class AllReviewsSuccessBody extends StatelessWidget {
  const AllReviewsSuccessBody({
    super.key,
    required this.comments,
    required this.onRefresh,
  });

  final List<ProductCommentEntity> comments;
  final Future<void> Function() onRefresh;

  double get _averageRating {
    if (comments.isEmpty) return 0;
    final total = comments.fold<int>(0, (sum, c) => sum + c.rate);
    return total / comments.length;
  }

  @override
  Widget build(BuildContext context) {
    if (comments.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.rate_review_outlined,
              size: 64.r,
              color: context.secondaryTextColor.withOpacity(0.4),
            ),
            SizedBox(height: 16.h),
            Text(
              'No reviews yet.',
              style: AppTextStyles.semiBold17(context).copyWith(
                color: context.secondaryTextColor,
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: CustomScrollView(
        slivers: [
          _ReviewsStatsHeader(
            reviewCount: comments.length,
            averageRating: _averageRating,
            comments: comments,
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 24.h),
            sliver: SliverList.separated(
              itemCount: comments.length,
              separatorBuilder: (_, __) => SizedBox(height: 12.h),
              itemBuilder: (context, index) =>
                  AllReviewItem(comment: comments[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewsStatsHeader extends StatelessWidget {
  const _ReviewsStatsHeader({
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
                  return _RatingBar(
                    star: star,
                    ratio: ratio,
                    context: context,
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

class _RatingBar extends StatelessWidget {
  const _RatingBar({
    required this.star,
    required this.ratio,
    required this.context,
  });

  final int star;
  final double ratio;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        children: [
          Text(
            '$star',
            style: AppTextStyles.regular11(context).copyWith(
              color: this.context.secondaryTextColor,
            ),
          ),
          SizedBox(width: 4.w),
          Icon(Icons.star_rounded, size: 10.r, color: const Color(0xFFFFC107)),
          SizedBox(width: 6.w),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: LinearProgressIndicator(
                value: ratio,
                minHeight: 6.h,
                backgroundColor: this.context.outlineColor.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
