
import 'package:flutter/material.dart';
import 'package:nova_store_app/core/utils/form_validators.dart';
import 'package:nova_store_app/core/widgets/custom_text_form_field.dart';

class EmailTextFormFiled extends StatelessWidget {
  const EmailTextFormFiled({
    super.key,
    required this.onSaved,
  });

  final void Function(String? p1)? onSaved;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: FormValidators.emailTextFormFieldValidator,
      hintText: 'Email',
      onSaved: onSaved,
    );
  }
}
