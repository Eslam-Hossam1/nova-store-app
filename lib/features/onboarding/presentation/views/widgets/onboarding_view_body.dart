import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/theming/app_colors.dart';
import 'package:nova_store_app/core/utils/assets.dart';
import 'package:nova_store_app/features/onboarding/presentation/resources/onboarding_colors.dart';
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
