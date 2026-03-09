import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nova_store_app/core/theme/app_text_styles.dart';
import 'package:nova_store_app/core/theme/theme_colors_extension.dart';

class CommentTextFormField extends StatelessWidget {
  const CommentTextFormField({
    super.key,
    required this.onSaved,
  });

  final void Function(String?) onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 3,
      maxLines: 5,
      inputFormatters: [LengthLimitingTextInputFormatter(300)],
      style: AppTextStyles.regular14(context)
          .copyWith(color: context.mainTextColor),
      decoration: InputDecoration(
        hintText: 'Write your comment here...',
        hintStyle: AppTextStyles.regular14(context)
            .copyWith(color: const Color(0xff605A65)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: context.primaryColor),
        ),
        contentPadding: const EdgeInsets.all(14),
      ),
      validator: (v) {
        if (v == null || v.trim().isEmpty) {
          return 'Comment cannot be empty';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
