import 'package:flutter/material.dart';
import 'package:nova_store_app/core/widgets/spacing/sliver_height_space.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_details_reviews_sections.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_details_section/product_details_section.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_header_section.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_images_page_view/product_images_page_view.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/similar_products_section.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});
  static const double _gapBetweenSectionsHeightSpace = 8;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ProductImagesPageView(),
        ),
        ProductHeaderSection(),
        SliverHeightSpace(height: _gapBetweenSectionsHeightSpace),
        ProductDetailsSection(),
        SliverHeightSpace(height: _gapBetweenSectionsHeightSpace),
        ProductDetailsReviewsSection(),
        SliverHeightSpace(height: 32),
        SimilarProductsSection(),
        SliverHeightSpace(height: 100),
      ],
    );
  }
}
