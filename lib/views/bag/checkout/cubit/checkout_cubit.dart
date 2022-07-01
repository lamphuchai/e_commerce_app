import 'dart:convert';
import 'dart:math';

import 'package:e_commerce_app/views/bag/bag.dart';
import 'package:e_commerce_app/views/bag/models/payment.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

  void loadingData() async {
    emit(CheckoutLoading());
    // await Future.delayed(const Duration(seconds: 1));
    Map<String, dynamic> data = {
      "address": {
        "fullName": "Jane Doe",
        "address": "414 Columbia Mine Road",
        "city": "Shinnston",
        "country": " United States",
        "state": "West Virginia",
        "zipCode": "26431"
      },
      "payment": {
        "name": "Jone Mauer",
        "number": "4003 9300 5831 2262",
        "expireDate": "08/20",
        "cvv": "515",
        "type": "visa",
        "defaultPayment": true
      },
      "delivery": {"name": "fedex", "intendDate": "3", "price": 15}
    };
    emit(CheckoutLoaded(
        address: Address.fromMap(data["address"]),
        payment: Payment.fromMap(data["payment"]),
        delivery: Delivery.fromMap(data["delivery"]),
        priceOrder: 127));
  }

  void test() {
    Map<String, dynamic> data = {
      "address": {
        "fullName": "Jae Doe",
        "address": "414 Columbia Mine Road",
        "city": "Shinnston",
        "country": " United States",
        "state": "West Virginia",
        "zipCode": "26431",
        "defaultAddress": true
      },
    };
    final checkoutLoaded = state;
    if (checkoutLoaded is CheckoutLoaded) {
      emit(checkoutLoaded.copyWith(address: Address.fromMap(data["address"])));
    }
  }

  void changeAddress(Address address) {
    Map<String, dynamic> data = {
      "address": {
        "id": "rt4566",
        "fullName": "Jae Doe",
        "address": "414 Columbia Mine Road",
        "city": "Shinnston",
        "country": " United States",
        "state": "West Virginia",
        "zipCode": "26431",
        "defaultAddress": true
      },
    };
    final checkoutLoaded = state;
    if (checkoutLoaded is CheckoutLoaded) {
      emit(checkoutLoaded.copyWith(address: Address.fromMap(data["address"])));
    }
  }
}
