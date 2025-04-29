import '../../domain/entities/all_services_entity.dart';

class AllServicesModel {
  final String name, desc, img, time, providerName,providerImg;
  final double price;

  AllServicesModel({
    required this.name,
    required this.desc,
    required this.price,
    required this.img,
    required this.providerName,
    required this.time,
    required this.providerImg
  });
  factory AllServicesModel.fromJson(Map<String, dynamic> json) {
    final images = json['images'] as List<dynamic>;
    return AllServicesModel(
        name: json['name'],
        desc: json['description'],
        price: json['price'],
        img: images.first,
        providerName: json['serviceProviderName'],
        providerImg: json['providerImg'],
        time: json['serviceRequestTime']);
  }

  AllServicesEntity toEntity() {
    return AllServicesEntity(
      name: name,
      desc: desc,
      price: price,
      img: img,
      providerName: providerName,
      providerImg: providerImg,
      time: time,
    );
  }
}
