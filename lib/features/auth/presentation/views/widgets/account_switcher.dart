import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../enums.dart';
import '../../manager/auth_provider.dart';
import 'custom_text_button.dart';

class AccountSwitch extends StatelessWidget {
  const AccountSwitch({
    super.key,
    required this.provider,
  });

  final AuthProvider provider;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 2.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          provider.authMode == AuthMode.signUp
              ? AppStrings.haveAnAccount
              : AppStrings.dontHaveAccount,
        ),
        CustomTextButton(
          text: provider.authMode == AuthMode.signUp
              ? AppStrings.login
              : AppStrings.createAccount,
          onPressed: () => provider.toggleAuthMode(),
        ),
      ],
    );
  }
}
