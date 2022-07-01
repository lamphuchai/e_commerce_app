import 'package:e_commerce_app/constants/app_icon.dart';
import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + kToolbarHeight);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: height, maxWidth: double.infinity),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: height * 1 / 6,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Login",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    )),
                SizedBox(
                    height: height * 3 / 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const EmailTextField(),
                        const SizedBox(
                          height: 20,
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
                                  "Forgot your password? ",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                onTap: () {},
                              ),
                              const Icon(
                                Icons.east,
                                color: Color(0xffDB3022),
                              )
                            ],
                          ),
                        ),
                        ButtonLarge(label: "LOGIN", onPressed: () {})
                      ],
                    )),
                Container(
                    height: height * 2 / 6,
                    padding: const EdgeInsets.only(bottom: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Or login with social account",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonLargeIcon(
                                iconUrl: AppIcon.google, onPressed: () {}),
                            const SizedBox(
                              width: 20,
                            ),
                            ButtonLargeIcon(
                                iconUrl: AppIcon.facebook, onPressed: () {}),
                          ],
                        )
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: "Password",
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      onChanged: (value) {},
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: "Email",
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: (value) {},
    );
  }
}
