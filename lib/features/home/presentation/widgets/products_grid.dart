import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/widgets/padding/sliver_app_padding.dart';
import 'package:nova_store_app/features/home/domain/entities/product_entity.dart';
import 'package:nova_store_app/features/home/presentation/widgets/product_item/product_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
    required this.products,
  });
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverAppPadding(
      child: SliverGrid.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3.3 / 6,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 24.h,
        ),
        itemBuilder: (context, index) {
          return ProductItem(productEntity: products[index]);
        },
      ),
    );
  }
}
