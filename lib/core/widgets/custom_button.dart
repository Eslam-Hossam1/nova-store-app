import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.backgroundColor,
    required this.child,
    required this.onPressed,
    this.width,
    this.borderRadius,
    this.verticalPadding,
  });
  final Color? backgroundColor;
  final Widget child;
  final VoidCallback onPressed;
  final double? width;
  final double? borderRadius;
  final double? verticalPadding;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.yellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding ?? 6.h,
          ),
          child: child,
        ),
      ),
    );
  }
}
