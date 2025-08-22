import 'package:flutter/material.dart';
import 'package:nova_store_app/features/onboarding/presentation/views/widgets/onboarding_girl.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          OnboardingGirl(),
        ],
      ),
    );
  }
}
