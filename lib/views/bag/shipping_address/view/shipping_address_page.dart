import 'package:e_commerce_app/views/bag/bag.dart';
import 'package:e_commerce_app/widgets/button_large.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingAddressPage extends StatelessWidget {
  const ShippingAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 244, 244),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Shipping Addresses"),
        leading: Builder(builder: (context) {
          bool onSuccess = context.select(
              (ShippingAddressCubit element) => element.state.onSuccess);
          return IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (onSuccess) {
                Navigator.pop(context);
              } else {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(17))),
                    context: context,
                    builder: (context) => Container(
                          height: 220,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () => Navigator.pop(context),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      width: 60,
                                      height: 6,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                  ),
                                  const Text("Notification",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: Text(
                                  "Default address is required",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: ButtonLarge(
                                    label: "OK",
                                    onPressed: () => Navigator.pop(context)),
                              )
                            ],
                          ),
                        ));
              }
            },
          );
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<ShippingAddressCubit, ShippingAddressState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.listAddress.length,
              itemBuilder: (context, index) =>
                  _buildAddressItem(state.listAddress[index], context),
            );
          },
        ),
      ),
      floatingActionButton: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () =>
            Navigator.pushNamed(context, "/bag/checkout/addShippingAddress"),
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

  Container _buildAddressItem(Address address, BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 25),
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.only(left: 28, right: 0),
            title: Text(address.fullName),
            trailing: TextButton(
              onPressed: () {},
              child: const Text(
                "Edit",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                address.fullAddress,
                textAlign: TextAlign.left,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // Checkbox(value: true, onChanged: (value) {})
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                    value: address.defaultAddress,
                    onChanged: (bool? value) => context
                        .read<ShippingAddressCubit>()
                        .setDefaultAddress(value: value!, id: address.id)),
                const Text(
                  "Use as the shipping address",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
