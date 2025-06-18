import 'review.dart';

class GetReviewsModel {
  List<Review>? reviews;

  GetReviewsModel({this.reviews});

  factory GetReviewsModel.fromJson(Map<String, dynamic> json) {
    final dynamic rawList = json['reviews']?['reviews'];
    return GetReviewsModel(
      reviews: rawList is List
          ? rawList
              .map((e) => Review.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }
  Map<String, dynamic> toJson() => {
        'reviews': reviews?.map((e) => e.toJson()).toList(),
      };
}
