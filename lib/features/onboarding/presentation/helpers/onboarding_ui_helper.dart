import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';

abstract class OnboardingUiHelper {
  static const double stackMinHeight = 650;
  static const double girlImageMinHeight = 450;
  static const double bottomSheetMinHeight =
      stackMinHeight - girlImageMinHeight;
  static const double girlSizeRatio = 0.68;
  static const double bottomSheetSizeRatio = 1 - girlSizeRatio;
  static final double yellowbadgeheight = 146.h;
  static const double badgeHiddenHeightRatio = 0.57;
  static double calculateBadgeBottomPosition(
      final double screenHeight, final double screenWidth) {
    return (screenHeight * bottomSheetSizeRatio).atLeast(bottomSheetMinHeight) -
        (yellowbadgeheight * badgeHiddenHeightRatio);
  }
}
