import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/core/widgets/star_rating.dart';
import 'package:nova_store_app/features/product-details/domain/entities/product_comment_entity.dart';

class AllReviewItem extends StatelessWidget {
  const AllReviewItem({super.key, required this.comment});

  final ProductCommentEntity comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: context.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18.r,
                backgroundColor: context.primaryColor.withOpacity(0.15),
                child: Icon(
                  Icons.person_rounded,
                  size: 20.r,
                  color: context.primaryColor,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  comment.userId,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.semiBold14(context).copyWith(
                    color: context.mainTextColor,
                  ),
                ),
              ),
              StarRating(rating: comment.rate.toDouble()),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            comment.comment,
            style: AppTextStyles.regular14(context).copyWith(
              color: context.mainTextColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
