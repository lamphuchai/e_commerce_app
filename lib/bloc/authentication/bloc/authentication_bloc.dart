import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(const AuthenticationState()) {
    on<AuthenticationLogin>(_onAuthenticationLogin);
    on<AuthenticationLogout>(_onAuthenticationLogout);
    on<AuthenticationInit>(_onAuthenticationInit);
  }
  void _onAuthenticationInit(AuthenticationInit event, Emitter emit) {
    emit(const AuthenticationState(status: AuthenticationStatus.unauthenticated));
  }

  void _onAuthenticationLogin(AuthenticationLogin event, Emitter emit) {
    emit(const AuthenticationState(status: AuthenticationStatus.authenticated));
  }

  void _onAuthenticationLogout(AuthenticationLogout event, Emitter emit) {
    emit(const AuthenticationState(
        status: AuthenticationStatus.unauthenticated));
  }
}
