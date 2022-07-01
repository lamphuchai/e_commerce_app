import 'package:flutter/material.dart';

class BuildListTitle extends StatelessWidget {
  const BuildListTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          title: const Text("Shipping info",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal)),
          onTap: () {},
          trailing: const Icon(Icons.arrow_right),
        ),
        const Divider(),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          title: const Text("Support",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal)),
          onTap: () {},
          trailing: const Icon(Icons.arrow_right),
        ),
        const Divider(),
      ],
    );
  }
}
