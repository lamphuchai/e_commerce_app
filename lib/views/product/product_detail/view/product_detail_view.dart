import 'package:e_commerce_app/cubits/product_new_cubit/product_new_cubit.dart';
import 'package:e_commerce_app/views/product/product_detail/view/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductNewCubit(),
      child: const ProductDetailPage(),
    );
  }
}
