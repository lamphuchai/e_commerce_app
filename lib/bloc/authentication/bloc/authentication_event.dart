part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationInit extends AuthenticationEvent {
  const AuthenticationInit();

  @override
  List<Object> get props => [];
}

class AuthenticationLogin extends AuthenticationEvent {
  final String email;
  final String password;
  const AuthenticationLogin({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class AuthenticationLogout extends AuthenticationEvent {
  const AuthenticationLogout();

  @override
  List<Object> get props => [];
}
