import 'package:e_commerce_app/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'catalog_state.dart';

class CatalogCubit extends Cubit<CatalogState> {
  CatalogCubit() : super(const CatalogState());

  void setCatalogState() {
    List<Product> products = [
      Product(
          title: "Evening Dress",
          price: 15,
          brandName: "Dorothy Perkins",
          rating: 5,
          image:
              "https://images.unsplash.com/photo-1546635834-78554e816d55?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1156",
          numberRating: 10,
          tag: "Blouses",
          priceSale: 20,
          typeProduct: 'new'),
      Product(
          title: "T-Shirt SPANISH",
          price: 15,
          brandName: "Mango",
          rating: 5,
          image:
              "https://images.unsplash.com/photo-1614251055880-ee96e4803393?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687",
          numberRating: 10,
          tag: "T-shirts",
          priceSale: 15,
          typeProduct: 'sale'),
      Product(
          title: "Blouse",
          price: 24,
          brandName: "Dorothy Perkins",
          rating: 4,
          image:
              "https://images.unsplash.com/photo-1593263049629-a6bbe863049f?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8c2hvcnRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500",
          numberRating: 24,
          tag: "Crop tops",
          priceSale: 10,
          typeProduct: 'sale'),
      Product(
          title: "Evening Dress",
          price: 15,
          brandName: "Dorothy Perkins",
          rating: 5,
          image:
              "https://images.unsplash.com/photo-1546635834-78554e816d55?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1156",
          numberRating: 10,
          tag: "Blouses",
          priceSale: 20,
          typeProduct: 'new'),
      Product(
          title: "T-Shirt SPANISH",
          price: 15,
          brandName: "Mango",
          rating: 5,
          image:
              "https://images.unsplash.com/photo-1614251055880-ee96e4803393?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687",
          numberRating: 10,
          tag: "T-shirts",
          priceSale: 15,
          typeProduct: 'sale'),
      Product(
          title: "Blouse",
          price: 24,
          brandName: "Dorothy Perkins",
          rating: 4,
          image:
              "https://images.unsplash.com/photo-1593263049629-a6bbe863049f?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8c2hvcnRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500",
          numberRating: 24,
          tag: "Crop tops",
          priceSale: 10,
          typeProduct: 'sale')
    ];
    emit(CatalogState(products: products, status: CatalogStatus.init));
  }

  void setFiltersProduct(List<Product> products) {
    emit(CatalogState(products: products, status: CatalogStatus.init));
  }
}
