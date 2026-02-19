import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/entities/category_entity.dart';
import 'package:nova_store_app/core/utils/constants.dart';
import 'package:nova_store_app/core/widgets/spacing/width_space.dart';
import 'package:nova_store_app/features/home/presentation/widgets/category_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonizerCategoryListView extends StatelessWidget {
  const SkeletonizerCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Skeletonizer(
        enabled: true,
        child: SizedBox(
          height: 100.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
              horizontal: Constants.appPadding.w,
            ),
            itemBuilder: (context, index) {
              return const CategoryItem(
                category: CategoryEntity(
                  id: '1',
                  name: 'Category Name',
                  image: '',
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const WidthSpace(width: 20);
            },
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}
