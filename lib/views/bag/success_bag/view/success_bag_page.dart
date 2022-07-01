import 'package:e_commerce_app/constants/app_icon.dart';
import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SuccessBagPage extends StatelessWidget {
  const SuccessBagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
              )),
          Expanded(flex: 1, child: Image.asset(AppIcon.success)),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: const [
                    Text(
                      "Success!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 34,
                          color: Colors.black),
                    ),
                    Text(
                        "Your order will be delivered soon.\nThank you for choosing our app!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.grey))
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.only(bottom: 20),
                child: ButtonLarge(
                  label: "CONTINUE SHOPPING",
                  onPressed: () => Navigator.pushNamed(context, "/"),
                ),
              ))
        ],
      ),
    );
  }
}
