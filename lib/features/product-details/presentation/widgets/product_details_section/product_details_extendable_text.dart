import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/core/widgets/spacing/height_space.dart';

class ProductDetailsExtendableText extends StatefulWidget {
  const ProductDetailsExtendableText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<ProductDetailsExtendableText> createState() =>
      _ProductDetailsExtendableTextState();
}

class _ProductDetailsExtendableTextState
    extends State<ProductDetailsExtendableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Column(
        children: [
          Text(
            widget.text,
            maxLines: isExpanded ? null : 5,
            overflow: isExpanded ? null : TextOverflow.ellipsis,
            style: AppTextStyles.regular14(context).copyWith(
              color: context.mainTextColor,
            ),
          ),
          const HeightSpace(height: 8),
          Icon(
            isExpanded
                ? Icons.keyboard_arrow_up_rounded
                : Icons.keyboard_arrow_down_rounded,
            color: context.mainTextColor,
            size: 20.w.clampLessQuarterAndMoreQuarter(20),
          ),
          const HeightSpace(height: 8),
        ],
      ),
    );
  }
}
