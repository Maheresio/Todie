import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/assets/app_svg_assets.dart';
import '../../../../../core/helpers/custom_snack_bar.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/widgets/custom_circular_indicator.dart';
import '../../../../splash/splash_view.dart';
import '../../manager/auth_cubit.dart';
import 'custom_outline_button.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is GoogleAuthFailure) {
          displaySnackBar(
            context,
            content: state.errorMessage,
          );
        }
        if (state is GoogleAuthSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SplashView(),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is GoogleAuthLoading) {
          return Center(
            child: CustomCircularIndicator(),
          );
        }
    
        return CustomOutlineButton(
          image: AppSvgAssets.googleSvg,
          text: AppStrings.continueWithGoogle,
          onPressed: () =>
              context.read<AuthCubit>().continueWithGoogle(),
        );
      },
    );
  }
}