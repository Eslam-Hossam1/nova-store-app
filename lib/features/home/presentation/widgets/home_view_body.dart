import 'package:flutter/material.dart';
import 'package:nova_store_app/core/widgets/spacing/sliver_height_space.dart';
import 'package:nova_store_app/features/home/presentation/widgets/catalouge_list_view.dart';
import 'package:nova_store_app/features/home/presentation/widgets/custom_purple_title.dart';
import 'package:nova_store_app/features/home/presentation/widgets/custom_purple_title_with_see_all.dart';
import 'package:nova_store_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:nova_store_app/features/home/presentation/widgets/products_grid.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        HomeAppBar(),
        SliverHeightSpace(height: 20),
        CustomPurpleTitleWithSeeAll(
          title: 'Catalogue',
        ),
        SliverHeightSpace(height: 16),
        CatalogueListView(),
        SliverHeightSpace(height: 32),
        CustomPurpleTitle(
          title: 'Featured',
        ),
        SliverHeightSpace(height: 16),
        ProductsGrid(),
      ],
    );
  }
}
