import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';

class DiscountBadge extends StatelessWidget {
  const DiscountBadge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 47.w,
      decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xffD23A3A), Color(0xffF49763)]),
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.r),
          bottomRight: Radius.circular(40.r),
        ),
      ),
      child: Center(
        child: Text(
          '-50%',
          style: AppTextStyles.bold11(context).copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
