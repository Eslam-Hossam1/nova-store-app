import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/widgets/padding/sliver_app_padding.dart';
import 'package:nova_store_app/core/widgets/spacing/sliver_height_space.dart';
import 'package:nova_store_app/features/home/presentation/widgets/catalouge_list_view.dart';
import 'package:nova_store_app/features/home/presentation/widgets/custom_purple_title.dart';
import 'package:nova_store_app/features/home/presentation/widgets/custom_purple_title_with_see_all.dart';
import 'package:nova_store_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:nova_store_app/features/home/presentation/widgets/product_item.dart';

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
        SliverAppPadding(
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
        ),
      ],
    );
  }
}
