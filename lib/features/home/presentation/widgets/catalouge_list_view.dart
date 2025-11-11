import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/core/utils/constants.dart';
import 'package:nova_store_app/core/widgets/spacing/width_space.dart';
import 'package:nova_store_app/features/home/presentation/widgets/catalouge_item.dart';

class CatalogueListView extends StatelessWidget {
  const CatalogueListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 88.w.clampLessHalfAndMoreHalf(88),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(
            horizontal: Constants.appPadding.w,
          ),
          itemBuilder: (context, index) {
            return CatalogueItem();
          },
          separatorBuilder: (context, index) {
            return WidthSpace(width: 20);
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
