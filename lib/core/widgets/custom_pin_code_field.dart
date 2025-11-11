import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';
import 'package:nova_store_app/core/utils/form_validators.dart';
import 'package:nova_store_app/core/utils/size_config.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeField extends StatelessWidget {
  const CustomPinCodeField(
      {super.key, this.onChanged, this.onCompleted, this.onSaved});
  final void Function(String)? onChanged;
  final void Function(String)? onCompleted;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      autovalidateMode: AutovalidateMode.disabled,
      onSaved: onSaved,
      validator: FormValidators.pincodeTextFormFieldValidator,
      pastedTextStyle: AppTextStyles.bold15(context).copyWith(
        color: context.mainTextColor,
      ),
      appContext: context,
      length: 6,
      textStyle: AppTextStyles.textStyleSemiBold34(context)
          .copyWith(color: context.mainTextColor),
      showCursor: false,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(16.r),
        fieldHeight: getfieldWidth(context),
        fieldWidth: getfieldWidth(context),
        activeColor: context.mainTextColor,
        inactiveColor: context.outlineColor,
        selectedColor: Colors.blue,
      ),
      onChanged: onChanged, // Optional for real-time input tracking
      onCompleted: onCompleted, // Callback when the user completes input
    );
  }

  double getfieldWidth(context) {
    double width = MediaQuery.sizeOf(context).width;
    return (48 * (width / SizeConfig.designWidth)).clamp(18, 60);
  }
}
