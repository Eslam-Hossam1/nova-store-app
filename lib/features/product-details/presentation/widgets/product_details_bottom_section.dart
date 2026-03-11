import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/core/widgets/Custom_text_button.dart';
import 'package:nova_store_app/core/widgets/spacing/width_space.dart';
import 'package:nova_store_app/features/product-details/presentation/widgets/product_details_favourite_button.dart';

class ProductDetailsBottomSection extends StatelessWidget {
  const ProductDetailsBottomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h.clampLessQuarterAndMoreQuarter(80),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400.withAlpha((0.12 * 255).toInt()),
            blurRadius: 3,
            offset: const Offset(0, -.5),
          ),
        ],
        color: context.scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w.clampLessEighthAndMoreEighth(24),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(
                  Icons.arrow_back_rounded,
                  size: 24.w.clampLessEighthAndMoreEighth(24),
                ),
              ),
              WidthSpace(width: 16),
              Expanded(
                child: CustomTextButton(
                  onPressed: () {},
                  text: 'Add to Cart',
                ),
              ),
              WidthSpace(width: 16),
              ProductDetailsFavouriteButton()
            ],
          ),
        ),
      ),
    );
  }
}
