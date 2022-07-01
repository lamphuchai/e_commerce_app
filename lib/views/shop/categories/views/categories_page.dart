import 'package:flutter/material.dart';

import 'page/women_page.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Categories",
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
          bottom: const TabBar(
              labelColor: Colors.black,
              indicatorColor: Colors.red,
              unselectedLabelStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              labelStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              labelPadding: EdgeInsets.symmetric(vertical: 11),
              tabs: [Text("Women"), Text("Men"), Text("Kids")]),
        ),
        body: const TabBarView(children: [WomenPage(), Text("3"), Text("3")]),
      ),
    );
  }
}
