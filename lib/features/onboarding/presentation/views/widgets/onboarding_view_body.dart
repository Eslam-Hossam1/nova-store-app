import 'package:flutter/material.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/features/onboarding/presentation/helpers/onboarding_ui_helper.dart';
import 'package:nova_store_app/features/onboarding/presentation/views/widgets/onboarding_bottom_sheet/onboading_bottom_sheet.dart';
import 'package:nova_store_app/features/onboarding/presentation/views/widgets/onboarding_girl.dart';
import 'package:nova_store_app/features/onboarding/presentation/views/widgets/onboarding_overlay.dart';
import 'package:nova_store_app/features/onboarding/presentation/views/widgets/yellow_badge.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: screenWidth,
            height: screenHeight.atLeast(OnboardingUiHelper.stackMinHeight),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: OnboardingGirl(
                    girlImageMinHeight: OnboardingUiHelper.girlImageMinHeight,
                    girlSizeRatio: OnboardingUiHelper.girlSizeRatio,
                  ),
                ),
                OnboardingOverlay(
                    stackMinHeight: OnboardingUiHelper.stackMinHeight),
                Positioned(
                  right: 0,
                  bottom: OnboardingUiHelper.calculateBadgeBottomPosition(
                    screenHeight,
                    screenWidth,
                  ),
                  child: YellowBadge(
                    yellowbadgeheight: OnboardingUiHelper.yellowbadgeheight,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: OnboardingBottomSheet(
                    bottomSheetMinHeight:
                        OnboardingUiHelper.bottomSheetMinHeight,
                    bottomSheetSizeRatio:
                        OnboardingUiHelper.bottomSheetSizeRatio,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
