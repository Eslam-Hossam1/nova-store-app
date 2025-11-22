import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_details_sections_title.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/similar_products_list_view.dart';
import 'package:nova_store_app/core/widgets/spacing/sliver_height_space.dart';

class SimilarProductsSection extends StatelessWidget {
  const SimilarProductsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.w.clampLessEighthAndMoreEighth(16),
            ),
            child: ProductDetailsSectionsTitle(
              title: 'Products related to this item',
            ),
          ),
        ),
        SliverHeightSpace(height: 16),
        SimilarProductsListView(),
      ],
    );
  }
}
