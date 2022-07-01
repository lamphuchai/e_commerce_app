import 'package:e_commerce_app/views/bag/bag.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shipping_address_state.dart';

class ShippingAddressCubit extends Cubit<ShippingAddressState> {
  ShippingAddressCubit() : super(const ShippingAddressState(onSuccess: true));

  void loadingState() {
    List<Address> data = const [
      Address(
          id: "344",
          fullName: "Kaylynne Lauria",
          address: "2868 Douglas Dairy Road",
          city: "Duffield",
          state: " Virginia",
          zipCode: "24244",
          country: "United States",
          defaultAddress: true),
      Address(
          id: "334gg44",
          fullName: " Jenett Newquist",
          address: "2868 Douglas Dairy Road",
          city: "Duffield",
          state: " Virginia",
          zipCode: "24244",
          country: "United States",
          defaultAddress: false),
    ];
    emit(ShippingAddressState(listAddress: data, onSuccess: true));
  }

  void setDefaultAddress({required bool value, required String id}) {
    final tmp = state.listAddress.map((item) {
      if (item.id == id) {
        return item.copyWith(defaultAddress: value);
      } else {
        return item.copyWith(defaultAddress: false);
      }
    }).toList();
    final test = tmp.where((item) => item.defaultAddress == true).toList();
    if (test.isEmpty) {
      emit(state.copyWith(listAddress: tmp, onSuccess: false));
    } else {
      emit(state.copyWith(listAddress: tmp, onSuccess: true));
    }
  }
}
