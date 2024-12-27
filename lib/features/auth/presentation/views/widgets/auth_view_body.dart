import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/assets/app_svg_assets.dart';
import 'package:todo_app/core/helpers/custom_snack_bar.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/app_styles.dart';
import 'package:todo_app/core/utils/widgets/custom_circular_indicator.dart';
import 'package:todo_app/features/auth/enums.dart';
import 'package:todo_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:todo_app/features/auth/presentation/manager/auth_provider.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_elevated_button.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_outline_button.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:todo_app/features/splash/splash_view.dart';

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();

    return Form(
      key: provider.formKey,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 30.w,
          ),
          child: Column(
            spacing: 10.h,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80.h,
              ),
              Text(
                provider.authMode == AuthMode.signUp
                    ? AppStrings.signUp
                    : AppStrings.signIn,
                style: AppStyles.textStyle25,
              ),
              BlocConsumer<AuthCubit, AuthState>(
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
              ),
              CustomOutlineButton(
                image: AppSvgAssets.mobileSvg,
                text: AppStrings.continueWithMobile,
              ),
              Text(
                AppStrings.or,
              ),
              CustomTextFormField(
                text: AppStrings.email,
                controller: provider.emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) => provider.emailValidator(value),
              ),
              CustomTextFormField(
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
              ),
              SizedBox(
                height: 2.h,
              ),
              BlocConsumer<AuthCubit, AuthState>(
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
                      return provider.authMode == AuthMode.signUp
                          ? CustomElevatedButton(
                              text: AppStrings.signUp,
                              onPressed: () {
                                if (provider.validate()) {
                                  context.read<AuthCubit>().signUp(
                                        email: provider.emailController.text,
                                        password:
                                            provider.passwordController.text,
                                      );
                                }
                              },
                            )
                          : CustomElevatedButton(
                              text: AppStrings.signIn,
                              onPressed: () {
                                if (provider.validate()) {
                                  context.read<AuthCubit>().signIn(
                                        email: provider.emailController.text,
                                        password:
                                            provider.passwordController.text,
                                      );
                                }
                              },
                            );
                    },
                  );
                },
              ),
              Row(
                spacing: 6.w,
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
              ),
              CustomTextButton(
                text: AppStrings.forgotPassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
