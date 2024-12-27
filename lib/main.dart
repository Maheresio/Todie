import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/helpers/firebase_init.dart';
import 'package:todo_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:todo_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:todo_app/features/auth/presentation/views/auth_view.dart';

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
