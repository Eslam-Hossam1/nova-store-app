import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/theming/app_colors.dart';
import 'package:nova_store_app/core/theming/app_text_styles.dart';

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 197.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(300.r),
          ),
          gradient: LinearGradient(
            colors: AppColors.gradi,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(bottom: 44.h, left: 24.w),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              style: AppTextStyles.bold25(context).copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
