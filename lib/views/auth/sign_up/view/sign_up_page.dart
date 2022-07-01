import 'package:e_commerce_app/bloc/authentication/authentication.dart';
import 'package:e_commerce_app/constants/app_icon.dart';
import 'package:e_commerce_app/views/auth/sign_up/sign_up.dart';
import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + kToolbarHeight);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
                height: height * 0.8 / 6,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Sign up",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                )),
            SizedBox(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const NameTextField(),
                const SizedBox(
                  height: 15,
                ),
                const EmailTextField(),
                const SizedBox(
                  height: 15,
                ),
                const PasswordTextField(),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Text(
                          "Already have an account? ",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        onTap: () => Navigator.pushNamed(context, "/login"),
                      ),
                      const Icon(
                        Icons.east,
                        color: Color(0xffDB3022),
                      )
                    ],
                  ),
                ),
                BlocListener<AuthenticationBloc, AuthenticationState>(
                  listener: (context, state) {
                    if (state.status == AuthenticationStatus.authenticated) {
                      Navigator.pushReplacementNamed(
                          context, "/bottom_nav_bav");
                    }
                  },
                  child: ButtonLarge(
                      label: "SIGN UP",
                      onPressed: () {
                        context.read<AuthenticationBloc>().add(
                            const AuthenticationLogin(
                                email: "email", password: "password"));
                      }),
                ),
                const SizedBox(
                  height: 60,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Or sign up with social account ",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonLargeIcon(iconUrl: AppIcon.google, onPressed: () {}),
                    const SizedBox(
                      width: 20,
                    ),
                    ButtonLargeIcon(
                        iconUrl: AppIcon.facebook, onPressed: () {}),
                  ],
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}

class NameTextField extends StatelessWidget {
  const NameTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return CustomTextField(
          labelText: "Name",
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          errorText: state.name.errText,
          onChanged: (value) =>
              context.read<SignUpCubit>().signUpNameChanged(value),
          suffixIcon: state.name.status != NameStatus.init
              ? (state.name.errText == null
                  ? const Icon(
                      Icons.done,
                      color: Color(0xff2AA952),
                    )
                  : const Icon(
                      Icons.close,
                      color: Color(0xffF01F0E),
                    ))
              : null,
        );
      },
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return CustomTextField(
          labelText: "Email",
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onChanged: (value) =>
              context.read<SignUpCubit>().signUpEmailChanged(value),
          errorText: state.email.errText,
          suffixIcon: state.email.status != EmailStatus.init
              ? (state.email.errText == null
                  ? const Icon(
                      Icons.done,
                      color: Color(0xff2AA952),
                    )
                  : const Icon(
                      Icons.close,
                      color: Color(0xffF01F0E),
                    ))
              : null,
        );
      },
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return CustomTextField(
          labelText: "Password",
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          onChanged: (value) =>
              context.read<SignUpCubit>().signUpPasswordChanged(value),
          errorText: state.password.errText,
          suffixIcon: state.password.status != PasswordStatus.init
              ? (state.password.errText == null
                  ? const Icon(
                      Icons.done,
                      color: Color(0xff2AA952),
                    )
                  : const Icon(
                      Icons.close,
                      color: Color(0xffF01F0E),
                    ))
              : null,
        );
      },
    );
  }
}
