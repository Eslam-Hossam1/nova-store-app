import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/core/widgets/spacing/height_space.dart';
import 'package:nova_store_app/features/product-details/presentation/manager/manager/product_details_cubit/product_details_cubit.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/add_comment_bottom_sheet.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_details_sections_background_container.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_details_sections_title_with_see_all.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/review_item.dart';

class ProductDetailsReviewsSection extends StatelessWidget {
  const ProductDetailsReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final comments =
        context.read<ProductDetailsCubit>().productDetailsEntity.comments;
    return ProductDetailsSectionsBackgroundContainer(
      applyBottomPadding: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductDetailsSectionsTitleWithSeeAll(
            title: 'Reviews (${comments.length})',
          ),
          const HeightSpace(height: 16),
          if (comments.isEmpty)
            Text(
              'No reviews yet.',
              style: AppTextStyles.regular14(context)
                  .copyWith(color: context.mainTextColor),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: comments.length.clamp(0, 3),
              separatorBuilder: (_, __) => const HeightSpace(height: 16),
              itemBuilder: (context, index) {
                final comment = comments[index];
                return ReviewItem(comment: comment);
              },
            ),
          const HeightSpace(height: 16),
          GestureDetector(
            onTap: () => AddCommentBottomSheet.show(context),
            child: Text(
              'Comment',
              style: AppTextStyles.regular12(context).copyWith(
                color: const Color(0xff605A65),
                decoration: TextDecoration.underline,
                decorationColor: const Color(0xff605A65),
              ),
            ),
          ),
          const HeightSpace(height: 16),
        ],
      ),
    );
  }
}
