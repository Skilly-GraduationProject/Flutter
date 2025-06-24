import 'dart:async';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class GalleryService {
  String? id;
  String? galleryName;
  String? description;
  String? deliverytime;
  String? video;
  String? serviceProviderId;
  List<dynamic>? images;

  GalleryService({
    this.id,
    this.galleryName,
    this.description,
    this.deliverytime,
    this.video,
    this.serviceProviderId,
    this.images,
  });

  factory GalleryService.fromJson(Map<String, dynamic> json) {
    return GalleryService(
      id: json['id'] as String?,
      galleryName: json['galleryName'] as String?,
      description: json['description'] as String?,
      deliverytime: json['deliverytime'] as String?,
      video: json['video'] as String?,
      serviceProviderId: json['serviceProviderId'] as String?,
      images: json['images'] as List<dynamic>?,
    );
  }

  FutureOr<Map<String, dynamic>> toJson() async => {
        'id': id,
        'galleryName': galleryName,
        'description': description,
        'deliverytime': deliverytime,
        if (video != null)
          'video': await MultipartFile.fromFile(
            video!,
            contentType: MediaType('video', 'mp4'),
          ),
        'serviceProviderId': serviceProviderId,
        if (images != null && images!.isNotEmpty)
          'Images': await Future.wait(
            images!.map((image) async {
              try {
                MultipartFile file = await MultipartFile.fromFile(image);
                return file;
              } catch (e) {
                // Handle the error, e.g., log it or return a default value
                print('Error processing image: $e');
              }
            }),
          ),
      };
}
