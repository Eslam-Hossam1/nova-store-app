import 'package:flutter/material.dart';
import 'package:nova_store_app/core/theming/app_text_styles.dart';
import 'package:nova_store_app/core/widgets/custom_button.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.width,
    required this.text,
    required this.onPressed,
  });
  final double? width;
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onPressed,
      width: width,
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: AppTextStyles.bold17(context).copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
