import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/core/widgets/spacing/height_space.dart';

class ProductDetailsExtendableText extends StatefulWidget {
  const ProductDetailsExtendableText({
    super.key,
  });

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
            maxLines: isExpanded ? null : 5,
            overflow: isExpanded ? null : TextOverflow.ellipsis,
            'Lorem ipsum dolor sit ametI’m old (rolling through my 50’s). But, this is my daughter in law’s favorite color right now.❤️ So I wear it whenever we hang out! She’s my fashion consultant who keeps me on trend🤣, consectetur adipiscing elit. Nullam nec metus vel ante feugiat placerat. Nullam nec metus vel ante feugiat placerat.',
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
