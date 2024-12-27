import 'package:flutter/material.dart';

import '../../../../../core/assets/app_svg_assets.dart';
import '../../../../../core/utils/app_strings.dart';
import 'custom_outline_button.dart';

class MobileSignInButton extends StatelessWidget {
  const MobileSignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlineButton(
      image: AppSvgAssets.mobileSvg,
      text: AppStrings.continueWithMobile,
    );
  }
}
