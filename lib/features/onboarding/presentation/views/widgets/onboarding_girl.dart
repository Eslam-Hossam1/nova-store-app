
import 'package:flutter/material.dart';
import 'package:nova_store_app/core/utils/assets.dart';
import 'package:nova_store_app/features/onboarding/presentation/resources/onboarding_colors.dart';

class OnboardingGirl extends StatelessWidget {
  const OnboardingGirl({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            Assets.imagesPngsOnboardingGirl,
            height: MediaQuery.sizeOf(context).height * 0.68,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 0.68,
          color: OnboardingColors.girlForgroundContainer.withAlpha(80),
        )
      ],
    );
  }
}
