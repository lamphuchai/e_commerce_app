import 'package:e_commerce_app/views/bag/bag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutShippingAddress extends StatelessWidget {
  const CheckoutShippingAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Shipping address",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            height: 110,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: BlocBuilder<CheckoutCubit, CheckoutState>(
              buildWhen: (previous, current) {
                if (previous is CheckoutLoaded && current is CheckoutLoaded) {
                  return previous.address != current.address;
                }
                return false;
              },
              builder: (context, state) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Jane Doe",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () async {
                            await Navigator.pushNamed(
                                context, "/bag/checkout/shippingAddressView");
                            print("back address");
                          },
                          child: const Text("Change",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.red)),
                        )
                      ],
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "3 Newbridge Court Chino Hills, CA 91709, United States",
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                );
              },
            )),
      ],
    );
  }
}
