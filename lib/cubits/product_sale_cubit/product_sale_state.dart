part of 'product_sale_cubit.dart';

enum Status { init, loading, loaded }
class ProductSaleState extends Equatable {
  const ProductSaleState(
      {this.products = const <Product>[], this.status = Status.init});
  final List<Product> products;
  final Status status;

  @override
  List<Object> get props => [status, products];

  ProductSaleState copyWith({
    List<Product>? products,
    Status? status,
  }) {
    return ProductSaleState(
  products:    products ?? this.products,
    status:  status ?? this.status,
    );
  }
}

