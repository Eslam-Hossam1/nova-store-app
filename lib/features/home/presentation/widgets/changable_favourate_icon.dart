import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/Functions/get_purple_gradient.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/core/theme/app_colors.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';

class ChangableFavourateIcon extends StatelessWidget {
  const ChangableFavourateIcon({
    super.key,
    required this.isFavourte,
  });

  final bool isFavourte;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: context.scaffoldBackgroundColor,
      radius: 16.w.clampLessEighthAndMoreEighth(16),
      child: Center(
        child: isFavourte
            ? Icon(
                Icons.favorite_rounded,
                color: AppColors.lightSecondary,
                size: 20.w.clampLessEighthAndMoreEighth(20),
              )
            : ShaderMask(
                shaderCallback: (Rect bounds) =>
                    getPurpleGradient(context).createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
                blendMode: BlendMode.srcIn,
                child: Icon(
                  Icons.favorite_outline_rounded,
                  size: 20.w.clampLessEighthAndMoreEighth(20),
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
