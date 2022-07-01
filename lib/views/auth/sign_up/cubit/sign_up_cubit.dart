import 'package:e_commerce_app/views/auth/sign_up/sign_up.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit()
      : super(const SignUpState(
            name: Name(value: ""),
            email: Email(value: ""),
            password: Password(value: "")));

  void signUpNameChanged(String value) {
    emit(state.copyWith(name: Name.validation(value)));
  }

  void signUpEmailChanged(String value) {
    final email = Email.validation(value);
    emit(state.copyWith(email: email));
  }

  void signUpPasswordChanged(String value) {
    emit(state.copyWith(password: Password.validation(value)));
  }
}
