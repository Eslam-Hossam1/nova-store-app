import 'package:flutter/material.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';

class ProductDetailsSectionsTitle extends StatelessWidget {
  const ProductDetailsSectionsTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          AppTextStyles.bold19(context).copyWith(color: context.primaryColor),
    );
  }
}
