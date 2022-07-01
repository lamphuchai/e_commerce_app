import 'package:e_commerce_app/views/product/product.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 244, 244),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Short dress"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  CustomPageView(),
                  OptionProduct(),
                  ProductInfo(),
                  BuildListTitle(),
                  ProductOtherListView(),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
          const BottomButtonContainer()
        ],
      ),
    );
  }
}
