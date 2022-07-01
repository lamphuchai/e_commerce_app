import 'package:e_commerce_app/constants/app_icon.dart';
import 'package:flutter/material.dart';

class CheckoutDeliveryMethod extends StatelessWidget {
  const CheckoutDeliveryMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Delivery method",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 72,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: const DecorationImage(
                            image: ExactAssetImage(AppIcon.fedexIcon)),
                        borderRadius: BorderRadius.circular(8)),
                    alignment: Alignment.bottomCenter,
                    child: const Text(
                      "2-3 days",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 72,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: const DecorationImage(
                            image: ExactAssetImage(AppIcon.uspsIcon)),
                        borderRadius: BorderRadius.circular(8)),
                    alignment: Alignment.bottomCenter,
                    child: const Text(
                      "2-3 days",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 72,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: const DecorationImage(
                            image: ExactAssetImage(AppIcon.dhlIcon)),
                        borderRadius: BorderRadius.circular(8)),
                    alignment: Alignment.bottomCenter,
                    child: const Text(
                      "2-3 days",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
          ],
        ),
      ],
    );
  }
}
