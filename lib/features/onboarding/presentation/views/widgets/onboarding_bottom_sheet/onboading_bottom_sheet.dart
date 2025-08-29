import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nova_store_app/core/di/service_locator.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/core/helpers/on_boarding_cache_helper.dart';
import 'package:nova_store_app/core/theming/app_colors.dart';
import 'package:nova_store_app/core/theming/app_text_styles.dart';
import 'package:nova_store_app/core/utils/assets.dart';
import 'package:nova_store_app/core/utils/spacing.dart';
import 'package:nova_store_app/features/onboarding/presentation/views/widgets/onboarding_bottom_sheet/get_started_button.dart';

class OnboardingBottomSheet extends StatelessWidget {
  const OnboardingBottomSheet({
    super.key,
    required this.bottomSheetMinHeight,
    required this.bottomSheetSizeRatio,
  });

  final double bottomSheetMinHeight;
  final double bottomSheetSizeRatio;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight:
            (MediaQuery.sizeOf(context).height * bottomSheetSizeRatio).atLeast(
          bottomSheetMinHeight,
        ),
      ),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
        gradient: LinearGradient(
          colors: AppColors.gradi,
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 24.h,
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              Assets.imagesSvgsNovaStore,
              width: (187.w).clamp(150, 200),
            ),
            verticalSpace(24),
            Text(
              textAlign: TextAlign.center,
              'Your everyday style made effortless\nwith the trends you love all in one place',
              style: AppTextStyles.regular14(context).copyWith(
                color: Colors.white,
              ),
            ),
            verticalSpace(32),
            GetStartedButton(
              onBoardingCacheHelper: getIt<OnBoardingCacheHelper>(),
            )
          ],
        ),
      ),
    );
  }
}
