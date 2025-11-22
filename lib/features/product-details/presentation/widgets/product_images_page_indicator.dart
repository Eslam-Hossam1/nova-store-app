import 'package:flutter/material.dart';

import 'package:nova_store_app/features/product-details/presentation/widgets/product_images_dot_indicator.dart';

class ProductImagesPageIndicator extends StatelessWidget {
  const ProductImagesPageIndicator({
    super.key,
    required this.currentIndexNotifier,
    required this.itemCount,
  });

  final ValueNotifier<int> currentIndexNotifier;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentIndexNotifier,
      builder: (context, currentIndex, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            itemCount,
            (index) => ProductImagesDotIndicator(
              isActive: currentIndex == index,
            ),
          ),
        );
      },
    );
  }
}
