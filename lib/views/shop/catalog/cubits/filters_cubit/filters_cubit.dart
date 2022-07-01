import 'package:e_commerce_app/models/models.dart';
import 'package:e_commerce_app/views/shop/shop.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filters_state.dart';

class FiltersCubit extends Cubit<FiltersState> {
  FiltersCubit(this.catalogCubit) : super(const FiltersState());

  final CatalogCubit catalogCubit;

  void initFilters() {
    emit(FiltersState(products: catalogCubit.state.products, tag: ""));
  }

  void filtersTagProduct(String tag) {
    final products = state.products;
    List<Product> tmp =
        products.where((product) => product.tag == tag).toList();
    catalogCubit.setFiltersProduct(tmp);
  }

  void setSortBy(String value) {
    emit(state.copyWith(sortBy: value));
  }
}
