import 'dart:async';

import 'package:dio/dio.dart';

class Servicesgallery {
  String? id;
  String? galleryName;
  String? description;
  String? deliverytime;
  String? video;
  String? serviceProviderId;
  List<dynamic>? images;

  Servicesgallery({
    this.id,
    this.galleryName,
    this.description,
    this.deliverytime,
    this.video,
    this.serviceProviderId,
    this.images,
  });

  factory Servicesgallery.fromJson(Map<String, dynamic> json) {
    return Servicesgallery(
      id: json['id'] as String?,
      galleryName: json['galleryName'] as String?,
      description: json['description'] as String?,
      deliverytime: json['deliverytime'] as String?,
      video: json['video'] as String?,
      serviceProviderId: json['serviceProviderId'] as String?,
      images: json['images'] as List<dynamic>?,
    );
  }

  FutureOr<Map<String, dynamic>> toJson() async=> {
        'id': id,
        'galleryName': galleryName,
        'description': description,
        'deliverytime': deliverytime,
        'video': video,
        'serviceProviderId': serviceProviderId,
        if (images != null && images!.isNotEmpty)
        'images': await Future.wait(
          images!.map((image) async {
            try {
              MultipartFile file = await MultipartFile.fromFile(
                image.path
              );
              return file;
            } catch (e) {
              // Handle the error, e.g., log it or return a default value
              print('Error processing image: $e');
            }
          }),
        ),
      };
}
