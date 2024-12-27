import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<void> signUp({required String email, required String password});
  Future<void> signIn({required String email, required String password});
  Future<User?> continueWithGoogle();
  Future<void> continueWithMobile();
}
