import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/entities/category_entity.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';
import 'package:nova_store_app/core/utils/constants.dart';
import 'package:nova_store_app/core/widgets/spacing/width_space.dart';
import 'package:nova_store_app/features/home/presentation/widgets/catalouge_item.dart';

class CatalogueListView extends StatelessWidget {
  const CatalogueListView({
    super.key,
    required this.categories,
  });
  final List<CategoryEntity> categories;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 100.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(
            horizontal: Constants.appPadding.w,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {
                context.push(RoutePaths.category, extra: category);
              },
              child: CatalogueItem(category: category),
            );
          },
          separatorBuilder: (context, index) {
            return const WidthSpace(width: 20);
          },
          itemCount: categories.length,
        ),
      ),
    );
  }
}
