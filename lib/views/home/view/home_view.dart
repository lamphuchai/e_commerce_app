import 'package:e_commerce_app/cubits/cubits.dart';
import 'package:e_commerce_app/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<ProductSaleCubit>(
        create: (BuildContext context) => ProductSaleCubit()..initProduct(),
      ),
      BlocProvider<ProductNewCubit>(
        create: (BuildContext context) => ProductNewCubit()..initProduct(),
      )
    ], child: const HomePage());
  }
}
