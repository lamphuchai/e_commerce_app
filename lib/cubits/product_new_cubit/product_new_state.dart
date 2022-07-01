part of 'product_new_cubit.dart';

class ProductNewState extends Equatable {
  const ProductNewState(
      {this.products = const <Product>[], this.status = Status.init});
  final List<Product> products;
  final Status status;

  @override
  List<Object> get props => [status, products];
}
