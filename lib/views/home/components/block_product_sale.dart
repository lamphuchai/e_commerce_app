import 'package:e_commerce_app/cubits/product_sale_cubit/product_sale_cubit.dart';
import 'package:e_commerce_app/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlockProductSale extends StatelessWidget {
  const BlockProductSale(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            subtitle: Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: TextButton(
              onPressed: () {},
              child: Text("View all",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.black)),
            ),
          ),
          const SizedBox(height: 10),
          const CustomListProducts()
        ],
      ),
    );
  }
}

class CustomListProducts extends StatefulWidget {
  const CustomListProducts({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomListProducts> createState() => _CustomListProductsState();
}

class _CustomListProductsState extends State<CustomListProducts> {
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<ProductSaleCubit>().loadingAddProduct();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 265,
        child: BlocBuilder<ProductSaleCubit, ProductSaleState>(
          builder: (context, state) {
            final products = state.products;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length + 1,
              controller: _scrollController,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (products.length == index) {
                  return Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.only(bottom: 80),
                      alignment: Alignment.center,
                      child: state.status == Status.loading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator())
                          : null);
                }
                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 17 : 0),
                  child: ProductCardSale(
                    product: products[index],
                    onTap: () {
                      Navigator.pushNamed(context, "product/product_detail");
                    },
                  ),
                );
              },
            );
          },
        ));
  }
}
