import 'package:e_commerce_app/views/home/home.dart';
import 'package:flutter/material.dart';

class ProductOtherListView extends StatelessWidget {
  const ProductOtherListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          title: const Text("You can also like this",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              )),
          trailing: const Text("12 items",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 11,
              )),
          onTap: () {},
        ),
        SizedBox(
          height: 270,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 16 : 0),
                  child: const ProductCardNew(),
                );
              })),
        ),
      ],
    );
  }
}
