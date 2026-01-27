import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/core/utils/assets.dart';

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
        child: Center(
          child: SvgPicture.asset(
            Assets.imagesSvgsPenEdit,
            width: 20.w.clampLessQuarterAndMoreQuarter(20),
          ),
        ));
  }
}
