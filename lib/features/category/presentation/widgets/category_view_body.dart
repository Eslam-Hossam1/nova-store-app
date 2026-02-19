import 'package:flutter/material.dart';
import 'package:nova_store_app/core/widgets/spacing/sliver_height_space.dart';
import 'package:nova_store_app/features/category/presentation/widgets/category_app_bar.dart';
import 'package:nova_store_app/features/home/presentation/widgets/custom_purple_title.dart';
import 'package:nova_store_app/features/home/presentation/widgets/products_grid.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CategoryAppBar(),
        const SliverHeightSpace(height: 24),
        CustomPurpleTitle(
          title: '163 items',
        ),
        const SliverHeightSpace(height: 16),
       // const ProductsGrid(),
      ],
    );
  }
}
