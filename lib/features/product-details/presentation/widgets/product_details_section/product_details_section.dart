import 'package:flutter/material.dart';
import 'package:nova_store_app/core/widgets/spacing/height_space.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_details_section/product_details_extendable_text.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_details_sections_background_container.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_details_sections_title.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProductDetailsSectionsBackgroundContainer(
      applyBottomPadding: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductDetailsSectionsTitle(title: 'Product Details'),
          const HeightSpace(height: 8),
          ProductDetailsExtendableText()
        ],
      ),
    );
  }
}
