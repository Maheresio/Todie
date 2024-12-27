import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import 'custom_text_button.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      text: AppStrings.forgotPassword,
    );
  }
}
