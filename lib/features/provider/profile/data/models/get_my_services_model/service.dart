import 'package:dio/dio.dart';
import 'package:grad_project/features/provider/profile/data/models/get_reviews_model/review.dart';

class ProviderService {
  String? id;
  String? serviceRequestTime;
  String? name;
  String? description;
  double? price;
  String? deliverytime;
  String? notes;
  String? serviceProviderId;
  String? serviceProviderName;
  String? providerImg;
  List<ImageModel>? images;
  String? categoryId;
  List<String>? deletedImages;
  List<Review>? reviews;
  String? video;
  int? countOfOffers;

  ProviderService({
    this.id,
    this.serviceRequestTime,
    this.name,
    this.description,
    this.price,
    this.deliverytime,
    this.notes,
    this.serviceProviderId,
    this.serviceProviderName,
    this.providerImg,
    this.images,
    this.categoryId,
    this.deletedImages,
    this.reviews,
    this.video,
    this.countOfOffers,
  });

  factory ProviderService.fromJson(Map<String, dynamic> json) =>
      ProviderService(
        id: json['id'] as String?,
        serviceRequestTime: json['serviceRequestTime'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        price: json['price'] as double?,
        deliverytime: json['deliverytime'] as String?,
        notes: json['notes'] as String?,
        serviceProviderId: json['serviceProviderId'] as String?,
        serviceProviderName: json['serviceProviderName'] as String?,
        providerImg: json['providerImg'] as String?,
        images: json['images'] != null
            ? (json['images'] as List)
                .map((image) =>
                    ImageModel.fromJson(image as Map<String, dynamic>))
                .toList()
            : null,
        categoryId: json['categoryId'] as String?,
        reviews: json['reviews'] != null
            ? (json['reviews'] as List)
                .map(
                    (review) => Review.fromJson(review as Map<String, dynamic>))
                .toList()
            : null,
        video: json['video'] as String?,
        countOfOffers: json['countOfOffers'] as int?,
      );

  Future<Map<String, dynamic>> toJson() async {
    return {
      if (id != null) 'id': id,
      if (serviceRequestTime != null) 'serviceRequestTime': serviceRequestTime,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (price != null) 'price': price!.toInt(),
      if (deliverytime != null) 'deliverytime': deliverytime,
      if (notes != null) 'notes': notes,
      if (serviceProviderId != null) 'serviceProviderId': serviceProviderId,
      if (serviceProviderName != null)
        'serviceProviderName': serviceProviderName,
      if (providerImg != null) 'providerImg': providerImg,
      if (images != null && images!.isNotEmpty)
        'images': await Future.wait(
          images!.map((image) async {
            try {
              MultipartFile file = await MultipartFile.fromFile(
                image.image!,
              );
              return file;
            } catch (e) {
              // Handle the error, e.g., log it or return a default value
              print('Error processing image: $e');
            }
          }),
        ),
      if (deletedImages != null) 'ImagesToDeleteIds': deletedImages ?? [],
    };
  }
}

class ImageModel {
  final String? image;
  final String? id;
  ImageModel({
    this.image,
    this.id,
  });
  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        image: json['img'] as String?,
        id: json['id'] as String?,
      );
  Map<String, dynamic> toJson() => {
        'image': image,
        'id': id,
      };
}
