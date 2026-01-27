
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/features/profile/presentation/models/profile_card_model.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.profileCardModel,
  });

  final ProfileCardModel profileCardModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListTile(
        onTap: () {},
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        leading: SvgPicture.asset(
          profileCardModel.svgPath,
          width: 16.w.clampLessHalfAndMoreHalf(16),
        ),
        title: Text(
          profileCardModel.title,
          style: AppTextStyles.semiBold17(context)
              .copyWith(color: context.mainTextColor),
        ),
      ),
    );
  }
}
