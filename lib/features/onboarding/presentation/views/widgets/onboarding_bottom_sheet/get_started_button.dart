import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_store_app/core/helpers/on_boarding_cache_helper.dart';
import 'package:nova_store_app/core/routing/routes_paths.dart';
import 'package:nova_store_app/core/widgets/Custom_text_button.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    super.key,
    required this.onBoardingCacheHelper,
  });
  final OnBoardingCacheHelper onBoardingCacheHelper;
  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      width: 280.w,
      text: 'Get Started',
      onPressed: () {
        onBoardingCacheHelper.setOnBoardingCompletedToTrue();
        context.go(RoutePaths.signUp);
      },
    );
  }
}
