import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/custom_snack_bar.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/widgets/custom_circular_indicator.dart';
import '../../../../splash/splash_view.dart';
import '../../../enums.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_provider.dart';
import 'custom_elevated_button.dart';

class AuthActionButton extends StatelessWidget {
  const AuthActionButton({
    super.key,
    required this.provider,
  });

  final AuthProvider provider;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          displaySnackBar(
            context,
            content: state.errorMessage,
          );
        }
        if (state is AuthSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SplashView(),
            ),
          );
        }
      },
      builder: (context, state) {
        return BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CustomCircularIndicator(),
              );
            }
            return CustomElevatedButton(
              text: provider.authMode == AuthMode.signUp
                  ? AppStrings.signUp
                  : AppStrings.signIn,
              onPressed: () {
                if (provider.validate()) {
                  provider.authMode == AuthMode.signUp
                      ? context.read<AuthCubit>().signUp(
                            email: provider.emailController.text.trim(),
                            password: provider.passwordController.text.trim(),
                          )
                      : context.read<AuthCubit>().signIn(
                            email: provider.emailController.text.trim(),
                            password: provider.passwordController.text.trim(),
                          );
                }
              },
            );
          },
        );
      },
    );
  }
}
