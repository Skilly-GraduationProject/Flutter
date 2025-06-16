
import '../../domain/entities/get_banners_entitiy.dart';

class GetBannersModel {
  final String img, imgUrl;

  GetBannersModel({
    required this.img,
    required this.imgUrl,
  });

  factory GetBannersModel.fromJson(Map<String, dynamic> json) {
    return GetBannersModel(
      img: json['imagePath'],
      imgUrl: json['url'],
    );
  }

  GetBannersEntity toEntity() {
    return GetBannersEntity(
      img: img,
      imgUrl:imgUrl,
    );
  }
}
