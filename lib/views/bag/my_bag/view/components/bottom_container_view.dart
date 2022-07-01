import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BottomContainerView extends StatelessWidget {
  const BottomContainerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: 36,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Enter your promo code",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black),
                child: const Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 36,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total amount:",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                "30" + String.fromCharCodes(Runes('\u0024 ')),
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        ButtonLarge(
            label: "CHECK OUT",
            onPressed: () => Navigator.pushNamed(context, "/bag/checkout")),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
