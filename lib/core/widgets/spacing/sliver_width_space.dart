import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliverWidthSpace extends StatelessWidget {
  const SliverWidthSpace({super.key, required this.width});

  ///give it as raw double don't use .h it already used
  final double width;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: width.w,
      ),
    );
  }
}
