import 'package:e_commerce_app/views/product/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RatingAndReviewsView extends StatelessWidget {
  const RatingAndReviewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => RatingAndReviewsCubit()..initState(),
      child:const RatingAndReviewsPage(),
    );
  }
}
