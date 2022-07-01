import 'package:e_commerce_app/views/product/rating_and_reviews/model/rating_review.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rating_and_reviews_state.dart';

class RatingAndReviewsCubit extends Cubit<RatingAndReviewsState> {
  RatingAndReviewsCubit() : super(const RatingAndReviewsState());

  void initState() {
    final data = [
      RatingReview(
          name: "Kim Shine",
          images: [
            "assets/images/small.png",
            "assets/images/small1.png",
            "assets/images/small.png",
            "assets/images/small.png"
          ],
          urlAvatar:
              "https://images.unsplash.com/photo-1645441261265-98688207313f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80",
          rating: 3,
          dateTime: DateTime(2021, 3, 12),
          content:
              "I loved this dress so much as soon as I tried it on I knew I had to buy it in another color. I am 5'3 about 155lbs and I carry all my weight in my upper body. When I put it on I felt like it thinned me put and I got so many compliments.")
    ];
    emit(state.copyWith(ratingReviews: data));
  }

  void setWithPhoto(bool value) {
    emit(state.copyWith(withPhoto: value));
  }
}
