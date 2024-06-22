part of 'auth_bloc.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {
  final bool? isLoading;
  AuthLoading({this.isLoading});
}

final class AuthSuccess extends AuthState {
  final UserModel? user;

  AuthSuccess({required this.user});
}

final class AuthError extends AuthState {
  final String? errorMessage;

  AuthError({this.errorMessage});
}
