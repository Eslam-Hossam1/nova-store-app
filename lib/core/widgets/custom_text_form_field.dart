import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/theme/app_colors.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final Widget? prefixIcon;
  const CustomTextFormField({
    this.onSaved,
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.validator,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.lightPurple,
      onSaved: onSaved,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const EdgeInsetsDirectional.only(start: 24, end: 10),
                child: prefixIcon)
            : null,
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: focusedBorder ??
            buildBorder(
              AppColors.purple,
            ),
        focusedErrorBorder: buildBorder(Colors.red),
        errorBorder: buildBorder(Colors.red),
        enabledBorder: enabledBorder ?? buildBorder(AppColors.grayLight, 2),
        hintStyle: hintStyle ??
            AppTextStyles.regular14(context)
                .copyWith(color: AppColors.darkGray),
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      obscureText: isObscureText ?? false,
      style: AppTextStyles.regular14(context)
          .copyWith(color: AppColors.darkPurple),
      validator: validator,
    );
  }

  OutlineInputBorder buildBorder(Color color, [double width = 1.5]) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
      borderRadius: BorderRadius.circular(8.r),
    );
  }
}
