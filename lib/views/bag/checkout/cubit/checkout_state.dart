part of 'checkout_cubit.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object> get props => [];
}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  final Address address;
  final Payment payment;
  final Delivery delivery;
  final int priceOrder;
  const CheckoutLoaded({
    required this.address,
    required this.payment,
    required this.delivery,
    required this.priceOrder,
  });

  @override
  List<Object> get props => [address, payment, delivery, priceOrder];

  CheckoutLoaded copyWith({
    Address? address,
    Payment? payment,
    Delivery? delivery,
    int? priceOrder,
  }) {
    return CheckoutLoaded(
      address: address ?? this.address,
      payment: payment ?? this.payment,
      delivery: delivery ?? this.delivery,
      priceOrder: priceOrder ?? this.priceOrder,
    );
  }
}
