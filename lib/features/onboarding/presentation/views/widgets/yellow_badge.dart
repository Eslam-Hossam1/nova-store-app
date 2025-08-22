
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/theming/app_colors.dart';

class YellowBadge extends StatelessWidget {
  const YellowBadge({
    super.key,
    required this.yellowbadgeheight,
  });

  final double yellowbadgeheight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (250.w).clamp(150, 350),
      height: yellowbadgeheight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            300.r,
          ),
        ),
        color: AppColors.yellow.withAlpha(170),
      ),
    );
  }
}
