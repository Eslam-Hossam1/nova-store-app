
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/utils/constants.dart';
import 'package:nova_store_app/core/widgets/custom_cached_network_image.dart';

class CatalogueItem extends StatelessWidget {
  const CatalogueItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 88.w.clampLessHalfAndMoreHalf(88),
            width: 88.w.clampLessHalfAndMoreHalf(88),
            child: CustomCachedNetworkImage(
              url: Constants.categoryImageUrlTest,
            ),
          ),
          Container(
            height: 88.w.clampLessHalfAndMoreHalf(88),
            width: 88.w.clampLessHalfAndMoreHalf(88),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xff34283E).withAlpha(
                    (.3 * 255).toInt(),
                  ),
                  Color(0xff34283E).withAlpha(
                    (.4 * 255).toInt(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 12,
            left: 12,
            child: Text(
              textAlign: TextAlign.center,
              "Women's fashion",
              style: AppTextStyles.semiBold14(context).copyWith(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
