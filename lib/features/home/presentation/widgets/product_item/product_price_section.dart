import 'package:flutter/material.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/core/widgets/spacing/width_space.dart';
import 'package:nova_store_app/features/home/domain/entities/product_entity.dart';

class ProductPriceSection extends StatelessWidget {
  const ProductPriceSection({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$${productEntity.finalPrice}',
          style: AppTextStyles.bold17(context).copyWith(
            color: Colors.red,
          ),
        ),
        WidthSpace(width: 5),
        Text(
          '\$${productEntity.price}',
          style: AppTextStyles.regular17(context).copyWith(
            color: context.secondaryTextColor,
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ],
    );
  }
}
