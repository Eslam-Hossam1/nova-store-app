import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliverHeightSpace extends StatelessWidget {
  const SliverHeightSpace({super.key, required this.height});

  ///give it as raw double don't use .h it already used
  final double height;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height.h,
      ),
    );
  }
}
