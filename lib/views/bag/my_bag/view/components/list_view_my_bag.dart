import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListViewMyBag extends StatelessWidget {
  const ListViewMyBag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return _buildMyBarItem();
          },
        ));
  }
  Container _buildMyBarItem() {
    return Container(
      width: double.infinity,
      height: 110,
      margin: const EdgeInsets.symmetric(vertical: 11),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.horizontal(left: Radius.circular(8)),
                child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        "https://images.unsplash.com/photo-1578587018452-892bacefd3f2?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387"),
              )),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 16, right: 0),
                    title: const Text("Pullover"),
                    // subtitle: const Text("Color: Black  Size: L"),
                    subtitle: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: "Color: ",
                          style: TextStyle(color: Colors.grey, fontSize: 11)),
                      TextSpan(
                          text: "Black",
                          style: TextStyle(color: Colors.black, fontSize: 11)),
                      TextSpan(
                          text: "   Size: ",
                          style: TextStyle(color: Colors.grey, fontSize: 11)),
                      TextSpan(
                          text: "L",
                          style: TextStyle(color: Colors.black, fontSize: 11))
                    ])),
                    trailing: Theme(
                      data: ThemeData(splashColor: Colors.transparent),
                      child: PopupMenuButton(
                        position: PopupMenuPosition.over,
                        elevation: 0.2,
                        padding: const EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                                color: Colors.grey, width: 0.2)),
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 1,
                            textStyle:
                                TextStyle(fontSize: 13, color: Colors.black),
                            child: Center(
                              child: Text(
                                "Add to favorites",
                              ),
                            ),
                          ),
                          const PopupMenuItem(
                            value: 2,
                            textStyle:
                                TextStyle(fontSize: 13, color: Colors.black),
                            child: Center(
                              child: Text(
                                "Delete from the list",
                              ),
                            ),
                          )
                        ],
                        icon: const Icon(Icons.more_vert),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 10),
                          child: Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0, 0.6),
                                        blurRadius: 0.6,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Icon(
                                  Icons.remove,
                                  size: 25,
                                  color: Colors.grey,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text("1",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0, 0.6),
                                        blurRadius: 0.6,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.only(right: 16),
                          alignment: Alignment.centerRight,
                          child: Text(
                            "30" + String.fromCharCodes(Runes('\u0024 ')),
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  ))
                ],
              ))
        ],
      ),
    );
  }
}
