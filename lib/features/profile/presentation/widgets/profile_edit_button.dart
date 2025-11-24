
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';

class ProfileEditButton extends StatelessWidget {
  const ProfileEditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.w.clampLessQuarterAndMoreQuarter(48),
      height: 48.w.clampLessQuarterAndMoreQuarter(48),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.edit,
        color: context.primaryColor,
      ),
    );
  }
}
