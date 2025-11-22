import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';

class ProductImagesDotIndicator extends StatelessWidget {
  const ProductImagesDotIndicator({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10.w.clampLessQuarterAndMoreQuarter(10),
      height: 10.h.clampLessQuarterAndMoreQuarter(10),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? Colors.white
            : Colors.white.withAlpha((0.5 * 255).toInt()),
      ),
    );
  }
}
