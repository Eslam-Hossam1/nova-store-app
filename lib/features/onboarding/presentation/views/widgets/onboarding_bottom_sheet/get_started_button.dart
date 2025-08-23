import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/widgets/Custom_text_button.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      width: 280.w,
      text: 'Get Started',
      onPressed: () {},
    );
  }
}
