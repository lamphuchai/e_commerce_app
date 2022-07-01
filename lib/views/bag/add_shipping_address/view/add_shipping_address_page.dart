import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddShippingAddressPage extends StatelessWidget {
  const AddShippingAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 244, 244),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Adding Shipping Address"),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                labelText: "Full name",
                color: Colors.white,
                onChanged: (value) {},
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                labelText: "Address",
                color: Colors.white,
                textInputAction: TextInputAction.next,
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                labelText: "City",
                color: Colors.white,
                textInputAction: TextInputAction.next,
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                labelText: "State/Province/Region",
                color: Colors.white,
                textInputAction: TextInputAction.next,
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                labelText: "Zip Code (Postal Code)",
                color: Colors.white,
                textInputAction: TextInputAction.next,
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                labelText: "Country",
                color: Colors.white,
                textInputAction: TextInputAction.next,
                onChanged: (value) {},
                textEditingController:
                    TextEditingController(text: "United States"),
                suffixIcon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_right)),
              ),
              const SizedBox(
                height: 25,
              ),
              ButtonLarge(label: "SAVE ADDRESS", onPressed: () {})
            ],
          )),
    );
  }
}
