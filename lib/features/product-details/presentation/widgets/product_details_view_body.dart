import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/core/widgets/spacing/sliver_height_space.dart';
import 'package:nova_store_app/core/widgets/spacing/width_space.dart';
import 'package:nova_store_app/features/home/presentation/widgets/product_item.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_details_reviews_sections.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_details_section/product_details_section.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_details_sections_title.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_header_section.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_images_page_view/product_images_page_view.dart';

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
        SliverToBoxAdapter(
          child: ProductDetailsSectionsTitle(
            title: 'Products related to this item',
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 270.h.clampLessQuarterAndMoreQuarter(270),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 140.w.clampLessQuarterAndMoreQuarter(140),
                  child: const ProductItem(),
                );
              },
              separatorBuilder: (context, index) {
                return const WidthSpace(width: 8);
              },
            ),
          ),
        ),
      ],
    );
  }
}
