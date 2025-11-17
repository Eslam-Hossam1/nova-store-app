import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nova_store_app/core/Functions/get_purple_gradient.dart';
import 'package:nova_store_app/core/utils/assets.dart';
import 'package:nova_store_app/core/widgets/padding/app_padding.dart';

class CustomPurpleGradientAppBar extends StatelessWidget {
  const CustomPurpleGradientAppBar({
    super.key,
    this.leadingWidget,
    this.trailingWidget,
    this.centerWidget,
  });
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final Widget? centerWidget;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 70.h,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: getPurpleGradient(context),
        ),
        child: AppPadding(
          child: Row(
            children: [
              if (leadingWidget != null) leadingWidget!,
              Spacer(),
              if (centerWidget == null)
                SvgPicture.asset(
                  width: 116.w.clamp(110, 130),
                  Assets.imagesSvgsNovaStore,
                ),
              Spacer(),
              if (trailingWidget != null) trailingWidget!,
            ],
          ),
        ),
      ),
    );
  }
}
