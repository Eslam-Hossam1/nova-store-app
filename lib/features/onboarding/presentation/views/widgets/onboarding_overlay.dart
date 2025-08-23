

import 'package:flutter/material.dart';
import 'package:nova_store_app/core/extensions/clamping.dart';
import 'package:nova_store_app/features/onboarding/presentation/resources/onboarding_colors.dart';

class OnboardingOverlay extends StatelessWidget {
  const OnboardingOverlay({
    super.key,
    required this.stackMinHeight,
  });

  final double stackMinHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height.atLeast(stackMinHeight),
      color: OnboardingColors.girlForgroundContainer.withAlpha(80),
    );
  }
}
