
import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BottomButtonContainer extends StatelessWidget {
  const BottomButtonContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
      height: 80,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 0),
            spreadRadius: 1,
            blurRadius: 8)
      ]),
      alignment: Alignment.topCenter,
      child: ButtonLarge(
        label: "ADD TO CART",
        onPressed: () {},
      ),
    );
  }
}