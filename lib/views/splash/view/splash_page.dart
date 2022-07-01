import 'package:e_commerce_app/bloc/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          switch (state.status) {
            case AuthenticationStatus.authenticated:
              Navigator.pushNamedAndRemoveUntil(
                  context, "/bottom_nav_bav", (route) => false);
              break;
            case AuthenticationStatus.unauthenticated:
              Navigator.pushNamedAndRemoveUntil(
                  context, "/sign_up", (route) => false);
              break;
            default:
              break;
          }
        },
        child: const SizedBox(
            height: 30, width: 30, child: CircularProgressIndicator()),
      )),
    );
  }
}
