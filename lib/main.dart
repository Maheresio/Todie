import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/firebase_init.dart';
import 'features/auth/data/repository/auth_repo_impl.dart';
import 'features/auth/presentation/manager/auth_cubit.dart';
import 'features/auth/presentation/views/auth_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInit();
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(
          AuthRepoImpl(),
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.black,
          ),
          home: child,
        ),
      ),
      child: AuthView(),
    ),
  );
}
