import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../manager/auth_provider.dart';
import 'widgets/auth_view_body.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        body: SafeArea(
          child: AuthViewBody(),
        ),
      ),
    );
  }
}
