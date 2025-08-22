import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/utils/size_config.dart';

abstract class AppTextStyles {
  static TextStyle bold25(context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: _getResponsiveText(context, baseFontSize: 25),
    );
  }

  static TextStyle bold19(context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: _getResponsiveText(context, baseFontSize: 19),
    );
  }

  static TextStyle bold17(context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: _getResponsiveText(context, baseFontSize: 17),
    );
  }

  static TextStyle regular14(context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: _getResponsiveText(context, baseFontSize: 14),
    );
  }

  static TextStyle semiBold14(context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: _getResponsiveText(context, baseFontSize: 14),
    );
  }

  static TextStyle regular11(context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: _getResponsiveText(context, baseFontSize: 11),
    );
  }

  static TextStyle regular12(context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: _getResponsiveText(context, baseFontSize: 12),
    );
  }

  static double _getResponsiveText(context, {required double baseFontSize}) {
    double scaleFactor = _getScaleFactor(context);
    double responsizeTextFontSize = scaleFactor * baseFontSize;
    double lowerLimit = baseFontSize * .75;

    double upperLimit = baseFontSize * 1.25;

    return responsizeTextFontSize.clamp(lowerLimit, upperLimit);
  }

  static double _getScaleFactor(context) {
    double width = MediaQuery.sizeOf(context).width;

    return width / SizeConfig.designWidth;
  }
}
