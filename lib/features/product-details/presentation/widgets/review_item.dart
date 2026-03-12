import 'package:flutter/material.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/core/widgets/spacing/height_space.dart';
import 'package:nova_store_app/core/widgets/star_rating.dart';
import 'package:nova_store_app/features/product-details/domain/entities/product_comment_entity.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.comment});

  final ProductCommentEntity comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          comment.userId,
          style: AppTextStyles.semiBold14(context).copyWith(
            color: context.mainTextColor,
          ),
        ),
        const HeightSpace(height: 8),
        StarRating(rating: comment.rate.toDouble()),
        const HeightSpace(height: 8),
        Text(
          comment.comment,
          style: AppTextStyles.regular14(context).copyWith(
            color: context.mainTextColor,
          ),
        ),
      ],
    );
  }
}
