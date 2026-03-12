import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/features/product-details/domain/entities/product_comment_entity.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/all_reviews/all_review_item.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/all_reviews/reviews_stats_header.dart';

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
          ReviewsStatsHeader(
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
