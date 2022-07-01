import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/views/product/product.dart';
import 'package:e_commerce_app/views/product/rating_and_reviews/model/rating_review.dart';
import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RatingAndReviewsPage extends StatelessWidget {
  const RatingAndReviewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 244, 244),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverPersistentHeader(
            floating: false,
            pinned: true,
            delegate: StickyTabBarDelegate(
                expandedHeight: 260, paddingTop: 44, collapsedHeight: 115),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 39,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: BlocBuilder<RatingAndReviewsCubit,
                            RatingAndReviewsState>(
                          buildWhen: (previous, current) =>
                              previous.ratingReviews != current.ratingReviews,
                          builder: (context, state) {
                            return Text(
                              '${state.ratingReviews.length} reviews',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            );
                          },
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BlocBuilder<RatingAndReviewsCubit,
                              RatingAndReviewsState>(
                            buildWhen: (previous, current) =>
                                previous.withPhoto != current.withPhoto,
                            builder: (context, state) {
                              return CustomCheckbox(
                                  value: state.withPhoto,
                                  onChanged: (bool? value) => context
                                      .read<RatingAndReviewsCubit>()
                                      .setWithPhoto(value!));
                            },
                          ),
                          const Text(
                            'With photo',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          )
                        ],
                      )),
                ],
              ),
            ),
            const ReviewsListView(),
            const SizedBox(
              height: 180,
            )
          ]))
        ],
      ),
      floatingActionButton: Container(
        width: double.infinity,
        height: 180,
        alignment: Alignment.bottomRight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white10,
              Colors.white,
            ],
            // tileMode: TileMode.repeated,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ElevatedButton.icon(
              onPressed: () => showModalBottomSheet(
                  backgroundColor: const Color.fromARGB(255, 248, 244, 244),
                  isScrollControlled: true,
                  // isDismissible: false,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(34))),
                  context: context,
                  builder: (context) => const BottomModalView()),
              style: ElevatedButton.styleFrom(primary: Colors.red),
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
              label: const Text(
                "Write a review",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

class ReviewsListView extends StatelessWidget {
  const ReviewsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return BlocBuilder<RatingAndReviewsCubit, RatingAndReviewsState>(
      buildWhen: (previous, current) =>
          previous.ratingReviews != current.ratingReviews,
      builder: (context, state) {
        return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: state.ratingReviews.length,
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              RatingReview review = state.ratingReviews[index];
              return Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                height: 370,
                child: Stack(fit: StackFit.expand, children: [
                  Positioned(
                      left: 16,
                      right: 0,
                      top: 16,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 18, bottom: 18),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              review.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 14),
                            ),
                            SizedBox(
                              height: 14,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: CustomRatingView(
                                        rating: review.rating,
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                            '${months[review.dateTime.month]} ${review.dateTime.day}, ${review.dateTime.year}',
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 11)),
                                      ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Text(
                              review.content,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              height: 104,
                              width: double.infinity,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  children: review.images
                                      .map((e) => Padding(
                                            padding: const EdgeInsets.only(
                                                right: 16),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.asset(e)),
                                          ))
                                      .toList()),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 30,
                              // color: Colors.red,
                              // alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Helpful",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 11),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon:
                                          const Icon(Icons.thumb_up, size: 15))
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                  Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                                fit: BoxFit.cover, imageUrl: review.urlAvatar),
                          )))
                ]),
              );
            }));
      },
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  StickyTabBarDelegate({
    required this.collapsedHeight,
    required this.expandedHeight,
    required this.paddingTop,
  });

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if (shrinkOffset <= 50) {
      return isIcon ? Colors.white : Colors.transparent;
    } else {
      final int alpha =
          (shrinkOffset / (maxExtent - minExtent) * 255).clamp(0, 255).toInt();
      return Color.fromARGB(alpha, 0, 0, 0);
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (shrinkOffset < 105) ...[
            const AppBarContainer(),
          ],
          Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: AppBar(
                backgroundColor: const Color.fromARGB(255, 248, 244, 244),
                centerTitle: true,
                title: Text(
                  'Rating & Reviews',
                  style: TextStyle(
                      color: makeStickyHeaderTextColor(shrinkOffset, false),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ))
        ],
      ),
    );
  }

  @override
  double get minExtent => collapsedHeight + paddingTop;

  @override
  double get maxExtent => expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 15, bottom: 10),
            child: Text(
              'Rating & Reviews',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          SizedBox(
            height: 95,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "4.3",
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Text(
                                  "23 ratings",
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.grey),
                                )
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 14,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [1, 2, 3, 4, 5]
                                          .map(
                                            (e) => const Icon(
                                              Icons.grade,
                                              size: 14,
                                              color: Colors.orange,
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      1,
                                      2,
                                      3,
                                      4,
                                    ]
                                        .map(
                                          (e) => const Icon(
                                            Icons.grade,
                                            size: 14,
                                            color: Colors.orange,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [1, 2, 3]
                                        .map(
                                          (e) => const Icon(
                                            Icons.grade,
                                            size: 14,
                                            color: Colors.orange,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [1, 2]
                                        .map(
                                          (e) => const Icon(
                                            Icons.grade,
                                            size: 14,
                                            color: Colors.orange,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [1]
                                        .map(
                                          (e) => const Icon(
                                            Icons.grade,
                                            size: 14,
                                            color: Colors.orange,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    )),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 14,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 130,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                                const Text(
                                  "12",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 14,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 80,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                                const Text(
                                  "9",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 14,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 50,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                                const Text(
                                  "4",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 14,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 30,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                                const Text(
                                  "2",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 14,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 5,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                                const Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
