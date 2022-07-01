part of 'shipping_address_cubit.dart';

class ShippingAddressState extends Equatable {
  const ShippingAddressState({this.listAddress = const <Address>[],required this.onSuccess});
  final List<Address> listAddress;
  final bool onSuccess;

  @override
  List<Object> get props => [listAddress];

  

  ShippingAddressState copyWith({
    List<Address>? listAddress,
    bool? onSuccess,
  }) {
    return ShippingAddressState(
      listAddress: listAddress ?? this.listAddress,
      onSuccess: onSuccess ?? this.onSuccess,
    );
  }
}
