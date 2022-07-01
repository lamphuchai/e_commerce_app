import 'package:flutter/material.dart';

class HeadContainerView extends StatelessWidget {
  const HeadContainerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 90,
          alignment: Alignment.bottomRight,
          child: Theme(
              data: ThemeData(),
              child:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search))),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            "My Bag",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
