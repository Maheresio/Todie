import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../manager/auth_provider.dart';
import 'email_text_form_field.dart';
import 'password_text_form_field.dart';

class TextFormFieldsSection extends StatelessWidget {
  const TextFormFieldsSection({
    super.key,
    required this.provider,
  });

  final AuthProvider provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        EmailTextFormField(provider: provider),
        PasswordTextFormField(provider: provider),
      ],
    );
  }
}
