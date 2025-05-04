import '../../domain/entities/offered_services_entity.dart';

class OfferedServicesModel {
  final String name, desc,img, date, providerName, providerImg;
  final double price;

  OfferedServicesModel({
    required this.name,
    required this.desc,
    required this.price,
    required this.img,
    required this.providerImg,
    required this.providerName,
    required this.date,
  });
  factory OfferedServicesModel.fromJson(Map<String, dynamic> json) {
     final List<String>images = (json['images'] as List<dynamic>).map((e) => e.toString()).toList();
    return OfferedServicesModel(
      name: json['name'],
      desc: json['description'],
      price: json['price'],
      providerName: json['serviceProviderName'],
      providerImg: json['providerImg'],
      date: json['serviceRequestTime'],
      img: images.isNotEmpty ? images.first : '',
    );
  }

  OfferedServicesEntity toEntity() {
    return OfferedServicesEntity(
      name: name,
      desc: desc,
      price: price,
      date: date,
      img: img,
      providerImg: providerImg,
      providerName: providerName
    );
  }
}
