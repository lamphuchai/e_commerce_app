import 'package:flutter/material.dart';

class RatingContainer extends StatelessWidget {
  const RatingContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () => Navigator.pushNamed(context, "product/rating_and_reviews"),
      child: Container(
        alignment: Alignment.centerLeft,
        height: 14,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            itemBuilder: ((context, index) {
              if (index == 5) {
                return const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text("(10)",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      )),
                );
              }
              return const Icon(
                Icons.grade,
                size: 14,
                color: Colors.orange,
              );
            })),
      ),
    );
  }
}
