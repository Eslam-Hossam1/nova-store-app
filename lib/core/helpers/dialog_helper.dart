import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/Functions/custom_awesome_dialog.dart';

abstract class DialogHelper {
  static void showErrorDialog(
    BuildContext context, {
    required String errorMessage,
    String? btnOkText,
    void Function()? btnOkOnPress,
    void Function(DismissType)? onDismissCallback,
    Widget? btnOk,
  }) {
    customAdaptiveAwesomeDialog(
      context,
      dialogType: DialogType.error,
      title: "Error",
      desc: errorMessage,
      btnOkOnPress: btnOkOnPress ?? () {},
      btnOkText: btnOkText,
      btnOk: btnOk,
      onDismissCallback: onDismissCallback ?? (DismissType _) {},
    ).show();
  }

  static void showWarningDialog(
    BuildContext context, {
    required String errorMessage,
    String? btnOkText,
    void Function()? btnOkOnPress,
    void Function(DismissType)? onDismissCallback,
    Widget? btnOk,
    Color? btnOkColor,
    Color? btnCancelColor,
    String? btnCanceltext,
  }) {
    customAdaptiveAwesomeDialog(context,
            dialogType: DialogType.warning,
            title: 'Warning',
            desc: errorMessage,
            btnOkOnPress: btnOkOnPress,
            btnOkText: btnOkText,
            btnOk: btnOk,
            btnOkColor: btnOkColor,
            onDismissCallback: onDismissCallback,
            btnCancelColor: btnCancelColor,
            btnCancelText: btnCanceltext,
            btnCancelOnPress: () {})
        .show();
  }

  static void showEndSessionDialog(
    BuildContext context, {
    String? btnOkText,
    void Function()? btnOkOnPress,
    void Function(DismissType)? onDismissCallback,
    Widget? btnOk,
    Color? btnOkColor,
    Color? btnCancelColor,
    String? btnCanceltext,
  }) {
    customAdaptiveAwesomeDialog(
      context,
      dialogType: DialogType.warning,
      title: 'Warning',
      desc: "Your session has expired. Please log in again.",
      btnOkOnPress: btnOkOnPress,
      btnOkText: btnOkText,
      btnOk: btnOk,
      onDismissCallback: onDismissCallback,
    ).show();
  }

  static void showSuccessDialog(
    BuildContext context, {
    required String successMessage,
    String? btnOkText,
    void Function()? btnOkOnPress,
    void Function(DismissType)? onDismissCallback,
    Widget? btnOk,
  }) {
    customAdaptiveAwesomeDialog(
      context,
      dialogType: DialogType.success,
      title: 'Success',
      desc: successMessage,
      btnOkOnPress: btnOkOnPress,
      btnOk: btnOk,
      btnOkText: btnOkText,
      onDismissCallback: onDismissCallback,
    ).show();
  }

  static void showCustomExitConfirmationDialog(BuildContext context,
      {String? errorMessage, void Function()? btnOkOnPress}) {
    DialogHelper.showWarningDialog(
      context,
      errorMessage: errorMessage ?? _warningExitConfirmationMessage,
      btnOkOnPress: btnOkOnPress ?? () => context.pop(),
      btnOkColor: Colors.red,
      btnOkText: 'Exit',
      btnCancelColor: Colors.green,
      btnCanceltext: "Stay",
    );
  }

  static final String _warningExitConfirmationMessage =
      "Are you sure you want to leave? You haven’t completed the verification yet and you may lose your progress.";
}
