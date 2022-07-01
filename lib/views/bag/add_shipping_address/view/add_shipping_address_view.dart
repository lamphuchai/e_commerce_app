import 'package:e_commerce_app/views/bag/add_shipping_address/add_shipping_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddShippingAddressView extends StatelessWidget {
  const AddShippingAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddShippingAddressCubit(),
      child: const AddShippingAddressPage(),
    );
  }
}
