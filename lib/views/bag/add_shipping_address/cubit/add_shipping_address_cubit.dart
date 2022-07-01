import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_shipping_address_state.dart';

class AddShippingAddressCubit extends Cubit<AddShippingAddressState> {
  AddShippingAddressCubit() : super(AddShippingAddressInitial());
}
