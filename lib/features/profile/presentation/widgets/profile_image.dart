import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/core/utils/constants.dart';
import 'package:nova_store_app/core/widgets/custom_cached_network_image.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72.w.clampLessQuarterAndMoreQuarter(72),
      height: 72.w.clampLessQuarterAndMoreQuarter(72),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffF4F3F4),
      ),
      child: SizedBox(
        width: 70.w.clampLessQuarterAndMoreQuarter(70),
        height: 70.w.clampLessQuarterAndMoreQuarter(70),
        child: ClipOval(
          child: CustomCachedNetworkImage(
            url: Constants.categoryImageUrlTest,
          ),
        ),
      ),
    );
  }
}
