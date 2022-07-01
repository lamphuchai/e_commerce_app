import 'package:e_commerce_app/views/bag/bag.dart';
import 'package:flutter/material.dart';

class MyBagPage extends StatelessWidget {
  const MyBagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 244, 244),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            HeadContainerView(),
            Expanded(child: ListViewMyBag()),
            BottomContainerView()
          ],
        ),
      ),
    );
  }
}
