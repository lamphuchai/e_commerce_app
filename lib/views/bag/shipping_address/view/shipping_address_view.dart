import 'package:e_commerce_app/views/bag/shipping_address/shipping_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingAddressView extends StatelessWidget {
  const ShippingAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShippingAddressCubit()..loadingState(),
      child: const ShippingAddressPage(),
    );
  }
}
