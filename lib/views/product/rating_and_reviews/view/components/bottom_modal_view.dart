import 'dart:io';

import 'package:e_commerce_app/widgets/button_large.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';

class BottomModalView extends StatefulWidget {
  const BottomModalView({Key? key}) : super(key: key);

  @override
  State<BottomModalView> createState() => _BottomModalViewState();
}

class _BottomModalViewState extends State<BottomModalView> {
  Future<void> getImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      List<XFile>? images = await picker.pickMultiImage();
      if (images!.isNotEmpty) {
        setState(() {
          listXFile.addAll(images);
        });
      }
    } catch (e) {}
  }

  List<XFile> listXFile = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1.5 / 2,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 248, 244, 244),
          borderRadius: BorderRadius.vertical(top: Radius.circular(34))),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 60,
                height: 6,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "What is you rate?",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            const SizedBox(
              height: 18,
            ),
            SizedBox(
              height: 37,
              child: RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                glow: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 12),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Please share your opinion \nabout the product",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 148,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: const TextField(
                maxLines: 6,
                decoration: InputDecoration(
                    hintText: "Your review", border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 104,
              child: ListView.builder(
                itemCount: listXFile.length + 1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: _buildItemCamera(),
                    );
                  } else {
                    XFile xFile = listXFile[index - 1];
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: SizedBox(
                        width: 104,
                        height: 104,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(xFile.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                    // return Container();
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonLarge(label: "SEND REVIEW", onPressed: () {})
          ],
        ),
      ),
    );
  }

  Widget _buildItemCamera() {
    return InkWell(
      onTap: () => getImage(),
      child: Container(
        width: 104,
        height: 104,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(50)),
              child: const Icon(
                Icons.photo_camera,
                size: 26,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Add your photos",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
