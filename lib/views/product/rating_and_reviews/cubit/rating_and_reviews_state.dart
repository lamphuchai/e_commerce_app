part of 'rating_and_reviews_cubit.dart';

class RatingAndReviewsState extends Equatable {
  const RatingAndReviewsState({this.ratingReviews = const <RatingReview>[],this.withPhoto = false});
  final List<RatingReview> ratingReviews;
  final bool withPhoto;

  @override
  List<Object> get props => [ratingReviews,withPhoto];

  RatingAndReviewsState copyWith({
    List<RatingReview>? ratingReviews,
    bool? withPhoto,
  }) {
    return RatingAndReviewsState(
      ratingReviews: ratingReviews ?? this.ratingReviews,
      withPhoto: withPhoto ?? this.withPhoto,
    );
  }
}
