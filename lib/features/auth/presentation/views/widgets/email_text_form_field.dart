import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../manager/auth_provider.dart';
import 'custom_text_form_field.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    super.key,
    required this.provider,
  });

  final AuthProvider provider;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      text: AppStrings.email,
      controller: provider.emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (value) => provider.emailValidator(value),
    );
  }
}