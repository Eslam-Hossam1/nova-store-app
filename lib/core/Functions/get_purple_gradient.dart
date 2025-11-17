import 'package:flutter/material.dart';
import 'package:nova_store_app/core/theme/app_colors.dart';

LinearGradient getPurpleGradient(BuildContext context) => LinearGradient(
      colors: Theme.of(context).brightness == Brightness.light
          ? AppColors.purpleGradient
          : AppColors.purpleGradientDark,
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
    );
