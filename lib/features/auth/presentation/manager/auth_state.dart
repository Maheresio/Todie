// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String errorMessage;
  AuthFailure({
    required this.errorMessage,
  });
}

class GoogleAuthLoading extends AuthState {}

class GoogleAuthSuccess extends AuthState {}

class GoogleAuthFailure extends AuthState {
  final String errorMessage;
  GoogleAuthFailure({
    required this.errorMessage,
  });
}
