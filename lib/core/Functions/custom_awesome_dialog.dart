import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:nova_store_app/core/theme/app_colors.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/utils/size_config.dart';

AwesomeDialog customAdaptiveAwesomeDialog(BuildContext context,
    {required DialogType dialogType,
    AnimType? animType,
    required String title,
    required String desc,
    String? btnOkText,
    void Function()? btnOkOnPress,
    void Function()? btnCancelOnPress,
    bool dismissOnTouchOutside = true,
    bool dismissOnBackKeyPress = true,
    Widget? btnOk,
    Color? btnOkColor,
    Color? btnCancelColor,
    String? btnCancelText,
    void Function(DismissType)? onDismissCallback}) {
  return AwesomeDialog(
    padding: EdgeInsets.symmetric(horizontal: 8),
    context: context,
    dialogType: dialogType,
    animType: animType ?? AnimType.rightSlide,
    title: title,
    desc: desc,
    dialogBackgroundColor: AppColors.dialogBackground,
    titleTextStyle: AppTextStyles.textStyleAwesomeDialogTitle(context),
    descTextStyle: AppTextStyles.textStyleAwesomeDialogDesc(context),
    btnOkColor: btnOkColor ?? Colors.green,
    btnCancelColor: btnCancelColor ?? Colors.red,
    btnCancelText: btnCancelText,
    btnCancelOnPress: btnCancelOnPress,
    btnOkOnPress: btnOkOnPress,
    btnOkText: btnOkText,
    btnOk: btnOk,
    dismissOnBackKeyPress: dismissOnBackKeyPress,
    dismissOnTouchOutside: dismissOnTouchOutside,
    onDismissCallback: onDismissCallback,
    width: getAwesomeDialogAdaptiveWidth(context),
  );
}

getAwesomeDialogAdaptiveWidth(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tabletBreakPoint) {
    return width * .9;
  } else {
    return width * .6;
  }
}
