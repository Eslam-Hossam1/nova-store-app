import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/widgets/padding/sliver_app_padding.dart';
import 'package:nova_store_app/features/home/presentation/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppPadding(
      child: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3.3 / 6,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 24.h,
        ),
        itemBuilder: (context, index) {
          return ProductItem();
        },
      ),
    );
  }
}
