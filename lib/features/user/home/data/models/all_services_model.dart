import '../../domain/entities/all_services_entity.dart';

class AllServicesModel {
  final String name, desc, img, time, providerName;
  final double price;

  AllServicesModel({
    required this.name,
    required this.desc,
    required this.price,
    required this.img,
    required this.providerName,
    required this.time,
  });
  factory AllServicesModel.fromJson(Map<String, dynamic> json) {
    final images = json['images'] as List<dynamic>;
    return AllServicesModel(
        name: json['name'],
        desc: json['description'],
        price: json['price'],
        img: images.first,
        providerName: json['serviceProviderName'],
        time: json['serviceRequestTime']);
  }

  AllServicesEntity toEntity() {
    return AllServicesEntity(
      name: name,
      desc: desc,
      price: price,
      img: img,
      providerName: providerName,
      time: time,
    );
  }
}
