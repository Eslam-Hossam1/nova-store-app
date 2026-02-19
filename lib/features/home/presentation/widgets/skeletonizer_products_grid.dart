import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/features/home/domain/entities/product_entity.dart';
import 'package:nova_store_app/features/home/presentation/widgets/product_item/product_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerProductsGrid extends StatelessWidget {
  const SkeletonizerProductsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.sliver(
      child: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3.3 / 6,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 24.h,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return ProductItem(
              productEntity: ProductEntity(
                  id: '1',
                  name: 'asdfasdfasdfasdf',
                  images: ['asdfasdfasdf'],
                  price: 123,
                  discount: 123,
                  finalPrice: 123,
                  stock: 123,
                  isFavorite: false,
                  rateProduct: 2));
        },
      ),
    );
  }
}
