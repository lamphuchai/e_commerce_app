import 'package:e_commerce_app/views/home/components/block_product_new.dart';
import 'package:e_commerce_app/views/home/home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          HomeBanner(),
          BlockProductSale(title: "Sale", subtitle: "Super summer sale"),
          BlockProductNew(
              title: "New", subtitle: "You’ve never seen it before!"),
        ],
      ),
    );
  }
}
