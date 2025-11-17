import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/Functions/get_purple_gradient.dart';

class RoundedAppBar extends StatelessWidget {
  const RoundedAppBar({super.key, required this.title});
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
          gradient: getPurpleGradient(context),
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
