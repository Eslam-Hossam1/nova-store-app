import 'package:flutter/material.dart';

abstract class AppColors {
  // Base colors from figma palette

  static const List<Color> purpleGradient = <Color>[
    Color(0xff845fa1),
    Color(0xff34283e),
  ];
  static const List<Color> purpleGradientDark = <Color>[
    Color(0xff6b4c7a),
    Color(0xff453554),
  ];
  static const Color darkPurple = Color(0xff34283e);
  static const Color gray = Color(0xff9b9b9b);
  static const Color yellow = Color(0xffe7b944);
  static const Color darkGray = Color(0xff605a65);
  static const Color red = Color(0xffce3e3e);
  static const Color grayLight = Color(0xffe1e1e1);
  static const Color white = Color(0xffffffff);
  static const Color dialogBackground = Color(0xFFF0F0F0);
  static const Color green = Color(0xff46ab62);
  static const Color bg = Color(0xffffffff);
  static const Color purple = Color(0xff553E67);
  static const Color lightPurple = Color(0xffD83DFC);

  // Light Theme Colors
  static const Color lightPrimary = darkPurple;
  static const Color lightSecondary = yellow;
  static const Color lightScaffoldBackground = bg;
  static const Color lightSecondScaffoldBackground = Color(0xfff4f3f4);
  static const Color lightDialogBackground = dialogBackground;
  static const Color lightOnSurfaceVariant = gray;
  static const Color lightOutline = grayLight;

  static const Color lightMainTextColor = darkPurple;
  static const Color lightSecondaryTextColor = gray;
  static const Color lightFormColor = grayLight;
  static const Color lightToastBackground = darkGray;
  static const Color lightCachedNetworkImagePlacholderColor = grayLight;

  // Dark Theme Colors
  static const Color darkPrimary = lightPurple;
  static const Color darkSecondary = yellow;
  static const Color darkScaffoldBackground = Color(0xff1a1a1a);
  static const Color darkSecondScaffoldBackground = Color(0xff000000);
  static const Color darkDialogBackground = Color(0xff2a2a2a);
  static const Color darkSurface = Color(0xff2a2a2a);
  static const Color darkOnSurfaceVariant = grayLight;
  static const Color darkOutline = darkGray;

  static const Color darkMainTextColor = white;
  static const Color darkSecondaryTextColor = gray;
  static const Color darkFormColor = Color(0xff2a2a2a);
  static const Color darkToastBackground = darkGray;
  static const Color darkCachedNetworkImagePlacholderColor = darkGray;
}
