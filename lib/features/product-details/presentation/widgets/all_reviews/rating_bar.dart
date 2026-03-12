import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({
    super.key,
    required this.star,
    required this.ratio,
  });

  final int star;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        children: [
          Text(
            '$star',
            style: AppTextStyles.regular11(context).copyWith(
              color: context.secondaryTextColor,
            ),
          ),
          SizedBox(width: 4.w),
          Icon(Icons.star_rounded, size: 10.r, color: const Color(0xFFFFC107)),
          SizedBox(width: 6.w),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: LinearProgressIndicator(
                value: ratio,
                minHeight: 6.h,
                backgroundColor: context.outlineColor.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
