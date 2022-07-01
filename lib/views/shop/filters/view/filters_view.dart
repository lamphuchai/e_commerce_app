import 'package:flutter/material.dart';

class FiltersView extends StatelessWidget {
  const FiltersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.3,
        title: const Text(
          "Filters",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const ListTile(
            tileColor: Color(0xfff5f5f5),
            title: Text("Price Range"),
          ),
          Container(
            height: 110,
            // margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [Text("10"), Text("100")],
                ),
                Container(
                  width: double.infinity,
                  child: RangeSlider(
                    // labels: const RangeLabels("10", "110"),
                    values: const RangeValues(10, 100),
                    max: 200,
                    activeColor: Colors.red,
                    inactiveColor: Colors.grey,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
