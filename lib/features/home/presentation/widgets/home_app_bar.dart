import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/core/utils/assets.dart';
import 'package:nova_store_app/core/widgets/custom_purple_gradient_app_bar.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPurpleGradientAppBar(
      leadingWidget: SvgPicture.asset(
        Assets.imagesSvgsMenu,
        width: 24.w.clampLessEighthAndMoreEighth(),
      ),
      trailingWidget: SvgPicture.asset(
        Assets.imagesSvgsBell,
        width: 24.w.clampLessEighthAndMoreEighth(),
      ),
    );
  }
}
