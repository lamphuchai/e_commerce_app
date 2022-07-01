import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map> dataListTitle = [
      {
        "title": "My orders",
        "subtitle": "Already have 12 orders",
        "routeName": "myOder",
      },
      {
        "title": "Shipping addresses",
        "subtitle": "3 ddresses",
        "routeName": "myOder",
      },
      {
        "title": "Payment methods",
        "subtitle": "Visa  **34",
        "routeName": "myOder",
      },
      {
        "title": "Promocodes",
        "subtitle": "You have special promocodes",
        "routeName": "myOder",
      },
      {
        "title": "My reviews",
        "subtitle": "Reviews for 4 items",
        "routeName": "myOder",
      },
      {
        "title": "Settings",
        "subtitle": "Notifications, password",
        "routeName": "myOder",
      }
    ];
    return Scaffold(
      appBar: AppBar(actions: [
        Theme(
            data: ThemeData(splashColor: Colors.transparent),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              splashRadius: 25,
            ))
      ]),
      body: SingleChildScrollView(
          // padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "My Profile",
              style: TextStyle(
                  fontSize: 34,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 64,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 64,
                    width: 64,
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1651353240157-8aeae0a37480?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80")),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Matilda Brown",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "matildabrown@mail.com",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              )),
          const SizedBox(
            height: 15,
          ),
          ListView(
            shrinkWrap: true,
            children: ListTile.divideTiles(
                context: context,
                tiles: dataListTitle.map((item) => _buildItemListTitle(
                    onTap: () {},
                    title: item["title"],
                    subtitle: item["subtitle"]))).toList(),
          )
        ],
      )),
    );
  }

  Widget _buildItemListTitle(
      {required String title, required String subtitle, VoidCallback? onTap}) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
            fontSize: 11, color: Colors.grey, fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(Icons.arrow_right),
      onTap: onTap,
    );
  }
}
