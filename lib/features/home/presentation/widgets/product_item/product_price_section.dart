
import 'package:flutter/material.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/core/widgets/spacing/width_space.dart';

class ProductPriceSection extends StatelessWidget {
  const ProductPriceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
