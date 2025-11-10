import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/theme/app_colors.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/features/auth/presentation/views/widgets/email_text_form_field.dart';

class EnterEmailSection extends StatelessWidget {
  const EnterEmailSection({
    super.key,
    this.onSaved,
  });
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60.h),
          Text(
            'Please enter your email',
            style: AppTextStyles.regular17(context).copyWith(
              color: context.mainTextColor,
            ),
          ),
          SizedBox(height: 24.h),
          EmailTextFormFiled(onSaved: onSaved),
        ],
      ),
    );
  }
}
