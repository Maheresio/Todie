import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../enums.dart';
import '../../manager/auth_provider.dart';

class AuthTile extends StatelessWidget {
  const AuthTile({
    super.key,
    required this.provider,
  });

  final AuthProvider provider;

  @override
  Widget build(BuildContext context) {
    return Text(
      provider.authMode == AuthMode.signUp
          ? AppStrings.signUp
          : AppStrings.signIn,
      style: AppStyles.textStyle25,
    );
  }
}
