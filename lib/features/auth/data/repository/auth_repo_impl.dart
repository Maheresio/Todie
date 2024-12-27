import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_app/features/auth/data/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<void> signUp({required String email, required String password}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<User?> continueWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return null;
    }
    //get the auth details from the request
    final googleAuth = await googleUser.authentication;
    //create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //sign in with the credential or sign up
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return userCredential.user;
  }

  @override
  Future<void> continueWithMobile() {
    // TODO: implement continueWithMobile
    throw UnimplementedError();
  }
}
