part of 'filters_cubit.dart';

class FiltersState extends Equatable {
  const FiltersState(
      {this.tag = "",
      this.products = const <Product>[],
      this.sortBy = "Price: lowest to high"});
  final List<Product> products;
  final String sortBy;

  final String tag;
  @override
  List<Object> get props => [tag, products,sortBy];

  FiltersState copyWith({
    List<Product>? products,
    String? sortBy,
    String? tag,
  }) {
    return FiltersState(
     products: products ?? this.products,
    sortBy  :sortBy ?? this.sortBy,
    tag :tag ?? this.tag,
    );
  }
}
