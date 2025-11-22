import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';

class ProductDetailsSectionsBackgroundContainer extends StatelessWidget {
  const ProductDetailsSectionsBackgroundContainer({
    super.key,
    this.applyTopPadding = true,
    required this.child,
    this.applyTopRadius = true,
    this.applyBottomPadding = true,
  });
  final bool applyTopPadding;
  final Widget child;
  final bool applyTopRadius;
  final bool applyBottomPadding;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: applyTopPadding ? 24.h : 0,
          bottom: applyBottomPadding ? 16.h : 0,
        ),
        decoration: BoxDecoration(
          color: context.scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: applyTopRadius ? Radius.circular(12.r) : Radius.zero,
            topRight: applyTopRadius ? Radius.circular(12.r) : Radius.zero,
            bottomLeft: Radius.circular(12.r),
            bottomRight: Radius.circular(12.r),
          ),
        ),
        child: child,
      ),
    );
  }
}
