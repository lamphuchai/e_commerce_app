part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState({required this.email,required this.password, required this.name});
  final Name name;
  final Email email;
  final Password password;
  @override
  List<Object> get props => [name,email,password];

  SignUpState copyWith({
    Name? name,
    Email? email,
    Password? password,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
