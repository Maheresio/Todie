import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../manager/auth_provider.dart';
import 'custom_text_form_field.dart';

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    super.key,
    required this.provider,
  });

  final AuthProvider provider;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: provider.passwordController,
      text: AppStrings.password,
      icon: GestureDetector(
        child: provider.obsecureText
            ? Icon(Icons.visibility)
            : Icon(Icons.visibility_off_rounded),
        onTap: () => provider.showOrHideText(),
      ),
      obscureText: provider.obsecureText,
      validator: (value) => provider.passwordValidator(value),
    );
  }
}
