import 'package:flutter/material.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/widgets/spacing/height_space.dart';

class ProfileTitleAndNumber extends StatelessWidget {
  const ProfileTitleAndNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Oleh Chabanov',
          style: AppTextStyles.bold19(context).copyWith(color: Colors.white),
        ),
        HeightSpace(height: 8),
        Text(
          "+38 (099) 123 45 67",
          style: AppTextStyles.regular14(context).copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
