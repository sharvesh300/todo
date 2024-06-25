part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String? message;
  AuthError({this.message});
}

class AuthSuccess extends AuthState {
  final UserModel? user;
  AuthSuccess({this.user});
}
