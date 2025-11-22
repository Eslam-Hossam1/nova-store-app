import 'package:flutter/material.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_images_page_view.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ProductImagesPageView(),
        ),
      ],
    );
  }
}
