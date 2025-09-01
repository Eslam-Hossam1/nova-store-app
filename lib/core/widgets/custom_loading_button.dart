import 'package:flutter/material.dart';
import 'package:nova_store_app/core/widgets/custom_button.dart';
import 'package:nova_store_app/core/widgets/custom_circular_progress_indecator.dart';

class CustomLoadingButton extends StatelessWidget {
  const CustomLoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: double.infinity,
      child: Center(
        child: CustomCircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
