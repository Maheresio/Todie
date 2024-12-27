import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../manager/auth_provider.dart';
import 'account_switcher.dart';
import 'auth_action_button.dart';
import 'auth_tile.dart';
import 'continue_section.dart';
import 'forgot_password.dart';
import 'text_form_fields_section.dart';

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
            spacing: 20.h,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100.h),
              AuthTile(provider: provider),
              ContinueSection(),
              Text(AppStrings.or),
              TextFormFieldsSection(provider: provider),
              
              AuthActionButton(provider: provider),
              AccountSwitch(provider: provider),
              ForgotPassword(),
            ],
          ),
        ),
      ),
    );
  }
}
