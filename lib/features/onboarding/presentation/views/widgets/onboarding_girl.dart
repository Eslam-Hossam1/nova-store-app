import 'package:flutter/material.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/core/utils/assets.dart';

class OnboardingGirl extends StatelessWidget {
  const OnboardingGirl({
    super.key,
    required this.girlImageMinHeight,
    required this.girlSizeRatio,
  });
  final double girlImageMinHeight;
  final double girlSizeRatio;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.imagesPngsOnboardingGirl,
      height: (MediaQuery.sizeOf(context).height * girlSizeRatio).atLeast(
        girlImageMinHeight,
      ),
      fit: BoxFit.cover,
    );
  }
}
