import 'package:flutter/material.dart';

import '../../../../../core/utils/app_constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.text,
    this.icon,
    this.validator,
    this.keyboardType,
    required this.controller,
    this.obscureText = false,
    this.enableInteractiveSelection,
    this.textInputAction,
  });

  final String text;
  final Widget? icon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final bool obscureText;
  final bool? enableInteractiveSelection;
  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      enableInteractiveSelection: enableInteractiveSelection,
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        isDense: true,
        alignLabelWithHint: true,
        label: Text(text),
        suffixIcon: icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppConstants.radius10,
          ),
        ),
      ),
    );
  }
}
