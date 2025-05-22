import '../../domain/entities/service_reviews_entity.dart';

class ServiceReviewsModel {
  final String id, name, feedback, img;
  final double rate;

  ServiceReviewsModel({
    required this.id,
    required this.feedback,
    required this.img,
    required this.name,
    required this.rate,
  });

  factory ServiceReviewsModel.fromJson(Map<String, dynamic> json) {
    return ServiceReviewsModel(
      id: json['serviceId'],
      name: json['userName'],
      feedback: json['feedback'],
      img: json['userImage'],
      rate: json['rating'],
    );
  }

  ServiceReviewsEntity toEntity() {
    return ServiceReviewsEntity(
      id: id,
      name: name,
      feedback: feedback,
      img: img,
      rate: rate,
    );
  }
}
