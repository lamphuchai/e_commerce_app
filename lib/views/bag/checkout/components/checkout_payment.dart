import 'package:e_commerce_app/constants/app_icon.dart';
import 'package:flutter/material.dart';

class CheckoutPayment extends StatelessWidget {
  const CheckoutPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Payment",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, "/bag/checkout/payment"),
              child: const Text("Change",
                  style: TextStyle(fontSize: 14, color: Colors.red)),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              width: 64,
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(AppIcon.payCard),
                  const Positioned(
                    bottom: -2,
                    child: Text(
                      "mastercard",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 9,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("**** **** **** 3947",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  )),
            )
          ],
        ),
      ],
    );
  }
}
