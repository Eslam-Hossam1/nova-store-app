import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/entities/category_entity.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/widgets/custom_cached_network_image.dart';
import 'package:nova_store_app/core/widgets/custom_cateogry_cached_network_Image.dart';

class CategoryItem extends StatefulWidget {
  final CategoryEntity category;
  const CategoryItem({
    super.key,
    required this.category,
  });

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool _imageLoaded = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 100.w,
            width: 100.w,
            child: CustomCategoryCachedNetworkImage(
              url: widget.category.image,
              onLoadingComplete: () {
                if (mounted) {
                  setState(() {
                    _imageLoaded = true;
                  });
                }
              },
            ),
          ),
          Container(
            height: 100.w,
            width: 100.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  const Color(0xff34283E).withValues(alpha: 0.3),
                  const Color(0xff34283E).withValues(alpha: 0.4),
                ],
              ),
            ),
          ),
          if (_imageLoaded)
            Positioned(
              right: 12,
              left: 12,
              child: Text(
                textAlign: TextAlign.center,
                widget.category.name,
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
