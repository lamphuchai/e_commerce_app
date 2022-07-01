import 'package:flutter/material.dart';

class CustomRatingView extends StatelessWidget {
  const CustomRatingView({Key? key,required this.rating}) : super(key: key);
  final int rating;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: ((context, index) {
          if (index < rating) {
            return const Icon(
              Icons.grade,
              size: 14,
              color: Colors.orange,
            );
          }
          return const Icon(
            Icons.grade_outlined,
            size: 14,
            color: Colors.grey,
          );
        }));
  }
}
