import 'package:flutter/foundation.dart';

class ProfileCardModel {
  final String svgPath;
  final String title;
  final VoidCallback onTap;
  ProfileCardModel(
      {required this.svgPath, required this.title, required this.onTap});
}
