import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/Functions/get_purple_gradient.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/core/theme/app_colors.dart';

class ProductDetailsFavouriteButton extends StatefulWidget {
  const ProductDetailsFavouriteButton({
    super.key,
  });

  @override
  State<ProductDetailsFavouriteButton> createState() =>
      _ProductDetailsFavouriteButtonState();
}

class _ProductDetailsFavouriteButtonState
    extends State<ProductDetailsFavouriteButton> {
  late bool isFavourite;

  @override
  void initState() {
    isFavourite = false;
    super.initState();
  }

  void toggle() {
    setState(() {
      isFavourite = !isFavourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isFavourite
        ? IconButton(
            onPressed: toggle,
            icon: Icon(
              Icons.favorite_rounded,
              color: AppColors.lightSecondary,
              size: 24.w.clampLessEighthAndMoreEighth(24),
            ),
          )
        : ShaderMask(
            shaderCallback: (Rect bounds) =>
                getPurpleGradient(context).createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            blendMode: BlendMode.srcIn,
            child: IconButton(
              onPressed: toggle,
              icon: Icon(
                Icons.favorite_outline_rounded,
                size: 24.w.clampLessEighthAndMoreEighth(24),
                color: Colors.white,
              ),
            ),
          );
  }
}
