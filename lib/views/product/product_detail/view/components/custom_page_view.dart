import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  int indexImage = 0;
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.65,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "https://images.unsplash.com/photo-1634039590509-012f218536f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      "https://images.unsplash.com/photo-1634039783493-03cc3cfc555b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      "https://images.unsplash.com/photo-1633958871521-189301d41280?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      "https://images.unsplash.com/photo-1633807883586-fea24eb04bd3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
    ];
    return Column(
      children: [
        SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1.4 / 3,
            child: PageView.builder(
                padEnds: false,
                itemCount: images.length,
                controller: pageController,
                onPageChanged: (int value) {
                  setState(() {
                    indexImage = value;
                  });
                },
                itemBuilder: ((context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        left: index == 0 ? 16 : 5,
                        right: index == images.length - 1 ? 16 : 0),
                    child: CachedNetworkImage(
                      imageUrl: images[index],
                      fit: BoxFit.cover,
                    ),
                  );
                }))),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 16, right: 16),
          height: 5,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: ((context, index) => Container(
                    color: Colors.white,
                    width: (MediaQuery.of(context).size.width - 16) /
                        images.length,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 5,
                      width: indexImage == index
                          ? (MediaQuery.of(context).size.width - 16) /
                              images.length
                          : 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: indexImage == index ? Colors.black : null,
                      ),
                    ),
                  ))),
        ),
      ],
    );
  }
}
