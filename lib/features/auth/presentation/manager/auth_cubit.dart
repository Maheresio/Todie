import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/handle_exceptions.dart';
import '../../data/repository/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final AuthRepo authRepo;

  Future<void> signUp({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await authRepo.signUp(email: email, password: password);

      emit(AuthSuccess());
    } catch (error) {
      String errorMessage = ExceptionHandler.handleError(error);
      emit(
        AuthFailure(
          errorMessage: errorMessage,
        ),
      );
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await authRepo.signIn(email: email, password: password);

      emit(AuthSuccess());
    } catch (error) {
      String errorMessage = ExceptionHandler.handleError(error);
      emit(
        AuthFailure(
          errorMessage: errorMessage,
        ),
      );
    }
  }

  Future<void> continueWithGoogle() async {
    emit(GoogleAuthLoading());

    try {
      await authRepo.continueWithGoogle();
      emit(GoogleAuthSuccess());
    } catch (error) {
      String errorMessage = ExceptionHandler.handleError(error);
      emit(
        GoogleAuthFailure(
          errorMessage: errorMessage,
        ),
      );
    }
  }
}
