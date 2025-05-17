import 'review.dart';

class GetReviewsModel {
  List<Review>? reviews;

  GetReviewsModel({this.reviews});

  factory GetReviewsModel.fromJson(Map<String, dynamic> json) {
    return GetReviewsModel(
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'reviews': reviews?.map((e) => e.toJson()).toList(),
      };
}
