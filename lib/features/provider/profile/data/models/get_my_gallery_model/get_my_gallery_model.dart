import 'servicesgallery.dart';

class GetMyGalleryModel {
  List<GalleryService>? servicesgallery;

  GetMyGalleryModel({this.servicesgallery});

  factory GetMyGalleryModel.fromJson(Map<String, dynamic> json) {
    return GetMyGalleryModel(
      servicesgallery: (json['servicesgallery'] as List<dynamic>?)
          ?.map((e) => GalleryService.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'servicesgallery': servicesgallery?.map((e) => e.toJson()).toList(),
      };
}
