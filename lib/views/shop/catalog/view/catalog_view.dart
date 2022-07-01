
import 'package:e_commerce_app/views/shop/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogView extends StatelessWidget {
  const CatalogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => CatalogCubit()..setCatalogState(),
      ),
      BlocProvider(
        create: (context) => FiltersCubit(context.read<CatalogCubit>())..initFilters(),
      )
    ], child: const CatalogPage());
  }
}
