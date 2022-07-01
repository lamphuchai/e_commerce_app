
import 'package:e_commerce_app/views/home/home.dart';
import 'package:flutter/material.dart';

class BlockProductNew extends StatelessWidget {
  const BlockProductNew({Key? key, required this.title, required this.subtitle})
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
          SizedBox(
              height: 265,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: index == 0 ? 17 : 0),
                    child: const ProductCardNew(),
                  );
                },
              ))
        ],
      ),
    );
  }
}
