import 'package:flutter/material.dart';

import 'google_sign_in_button.dart';
import 'mobile_sign_in_button.dart';

class ContinueSection extends StatelessWidget {
  const ContinueSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        GoogleSignInButton(),
        MobileSignInButton(),
      ],
    );
  }
}