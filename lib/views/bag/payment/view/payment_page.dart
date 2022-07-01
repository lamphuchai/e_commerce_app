import 'package:e_commerce_app/constants/app_icon.dart';
import 'package:e_commerce_app/widgets/button_large.dart';
import 'package:e_commerce_app/widgets/custom_text_field.dart';
import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Payment methods"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            title: Text("Your payment cards"),
          ),
          _buildPaymentMethod(true),
          _buildPaymentMethod(false),
        ],
      )),
      floatingActionButton: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(34))),
              context: context,
              builder: (context) => Container(
                    height: MediaQuery.of(context).size.height * 2 / 3,
                    // padding:
                    //     const EdgeInsets.only(top: 10, left: 16, right: 16),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              width: 60,
                              height: 6,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Add new card",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                CustomTextField(
                                  labelText: "Name on card",
                                  onChanged: (value) {},
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                  labelText: "Card number",
                                  onChanged: (value) {},
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                  labelText: "Expire Date",
                                  onChanged: (value) {},
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextField(
                                  labelText: "CVV",
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                      4,
                                    )),
                                    side: const BorderSide(color: Colors.grey),
                                    value: false,
                                    onChanged: (bool? value) {}),
                                const Text(
                                  "Use as default payment method",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 5),
                            child: ButtonLarge(
                                label: "ADD CARD", onPressed: () {}),
                          )
                        ],
                      ),
                    ),
                  ));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.black),
          width: 50,
          height: 50,
          alignment: Alignment.center,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildPaymentMethod(bool defaultCard) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              height: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage(AppIcon.cardMaster)),
              ),
              child: Column(
                children: [
                  Expanded(flex: 1, child: Container()),
                  Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: const Text(
                          "* * * *  * * * *  * * * *  3947",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Card Holder Name",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Jennyfer Doe",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Expiry Date",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "05/23",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      )),
                ],
              ),
            ),
            if (!defaultCard) ...[
              Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white54,
                  ))
            ]
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomCheckbox(value: defaultCard, onChanged: (bool? value) {}),
              const Text(
                "Use as default payment method",
                style: TextStyle(fontSize: 14, color: Colors.black),
              )
            ],
          ),
        ),
      ],
    );
  }
}
