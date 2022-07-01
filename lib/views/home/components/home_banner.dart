import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 1 / 4,
        width: size.width,
        color: Colors.red,
        child: Stack(children: [
          CachedNetworkImage(
              width: size.width,
              height: size.height,
              fit: BoxFit.cover,
              imageUrl:
                  "https://images.unsplash.com/photo-1551386204-741cd030e1da?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869"),
          Positioned(
              left: 16,
              bottom: 20,
              child: Text(
                "Street clothes",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Colors.white),
              ))
        ]));
  }
}
