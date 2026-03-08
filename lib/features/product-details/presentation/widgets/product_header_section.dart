import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store_app/core/theme/app_colors.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/core/widgets/spacing/height_space.dart';
import 'package:nova_store_app/core/widgets/spacing/width_space.dart';
import 'package:nova_store_app/core/widgets/star_rating.dart';
import 'package:nova_store_app/features/product-details/presentation/manager/manager/product_details_cubit/product_details_cubit.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_details_sections_background_container.dart';

class ProductHeaderSection extends StatelessWidget {
  const ProductHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final product = context.read<ProductDetailsCubit>().productDetailsEntity;
    final bool inStock = product.stock > 0;

    return ProductDetailsSectionsBackgroundContainer(
      applyTopPadding: false,
      applyTopRadius: false,
      applyBottomPadding: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeightSpace(height: 14),
          Row(
            children: [
              StarRating(rating: product.rateProduct.toDouble()),
              const WidthSpace(width: 6),
              Text(
                '${product.comments.length} reviews',
                style: AppTextStyles.regular14(context).copyWith(
                  color: const Color(0xff605A65),
                ),
              ),
              const Spacer(),
              Text(
                inStock ? 'In Stock' : 'Out of Stock',
                style: AppTextStyles.bold12(context).copyWith(
                  color: inStock ? AppColors.green : AppColors.lightSecondary,
                ),
              ),
            ],
          ),
          const HeightSpace(height: 12),
          Text(
            product.name,
            style: AppTextStyles.regular17(context)
                .copyWith(color: context.mainTextColor),
          ),
          const HeightSpace(height: 12),
          Text(
            '\$${product.finalPrice}',
            style: AppTextStyles.bold22(context)
                .copyWith(color: context.primaryColor),
          ),
          const HeightSpace(height: 16),
        ],
      ),
    );
  }
}
