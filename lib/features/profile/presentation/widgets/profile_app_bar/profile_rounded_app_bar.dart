import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/Functions/get_purple_gradient.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/core/widgets/spacing/width_space.dart';
import 'package:nova_store_app/features/profile/presentation/widgets/profile_app_bar/profile_edit_button.dart';
import 'package:nova_store_app/features/profile/presentation/widgets/profile_app_bar/profile_image.dart';
import 'package:nova_store_app/features/profile/presentation/widgets/profile_app_bar/profile_title_and_number.dart';

class ProfileRoundedAppBar extends StatelessWidget {
  const ProfileRoundedAppBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Container(
            height: 150.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(300.r),
              ),
              gradient: getPurpleGradient(context),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                top: 16.h.clampLessQuarterAndMoreQuarter(16),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileImage(),
                    WidthSpace(width: 16),
                    ProfileTitleAndNumber(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 12,
            top: 66.h.clampLessQuarterAndMoreQuarter(66),
            child: ProfileEditButton(),
          )
        ],
      ),
    );
  }
}
