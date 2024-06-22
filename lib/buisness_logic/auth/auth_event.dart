part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String userName;

  SignUpEvent(this.email, this.password,this.userName);

  @override
  List<Object> get props => [email, password];
}

class SignOutEvent extends AuthEvent {}
