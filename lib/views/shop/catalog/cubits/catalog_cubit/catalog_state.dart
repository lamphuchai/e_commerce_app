part of 'catalog_cubit.dart';

enum CatalogStatus { init, loading, loaded }

class CatalogState extends Equatable {
  const CatalogState(
      {this.products = const <Product>[], this.status = CatalogStatus.init});
  final CatalogStatus status;
  final List<Product> products;
  @override
  List<Object> get props => [products, status];

  CatalogState copyWith({
    CatalogStatus? status,
    List<Product>? products,
  }) {
    return CatalogState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }
}
