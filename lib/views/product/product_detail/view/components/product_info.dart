import 'package:e_commerce_app/views/product/product.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            dense: true,
            title: const Text("H&M",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            trailing: Text(String.fromCharCodes(Runes('\u0024')) + "19.99",
                textAlign: TextAlign.start,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            subtitle: const Text("Short black dress",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                )),
          ),
          const RatingContainer(),
          const SizedBox(
            height: 10,
          ),
          const Text(
              "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              )),
        ],
      ),
    );
  }
}
