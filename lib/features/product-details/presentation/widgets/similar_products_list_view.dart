import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/core/widgets/spacing/width_space.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/similar_product_item.dart';

class SimilarProductsListView extends StatelessWidget {
  const SimilarProductsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 270.h.clampLessQuarterAndMoreQuarter(270),
        child: ListView.separated(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w.clampLessQuarterAndMoreQuarter(16),
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 140.w.clampLessQuarterAndMoreQuarter(140),
              child: SimilarProductItem(),
            );
          },
          separatorBuilder: (context, index) {
            return const WidthSpace(width: 16);
          },
        ),
      ),
    );
  }
}
