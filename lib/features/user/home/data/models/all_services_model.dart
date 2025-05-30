import '../../domain/entities/all_services_entity.dart';

class AllServicesModel {
  final String name,
      desc,
      id,
      img,
      time,
      providerName,
      providerImg,
      deliveryTime;
  final String? notes, video;
  final List<String> images;
  final double price;

  AllServicesModel({
    required this.name,
    required this.desc,
    required this.id,
    required this.price,
    required this.img,
    required this.providerName,
    required this.time,
    required this.notes,
    required this.images,
    required this.providerImg,
    required this.deliveryTime,
    required this.video,
  });

  factory AllServicesModel.fromJson(Map<String, dynamic> json) {
    final List<String> images = (json['images'] as List<dynamic>)
        .map((e) => e['img'].toString())
        .toList();

    final String? videoUrl = json['video'];

    final time = json['serviceRequestTime'];
    final date = time.split('T').first;

    return AllServicesModel(
      id: json['id'],
      name: json['name'],
      desc: json['description'],
      price: (json['price'] as num).toDouble(),
      img: images.isNotEmpty ? images.first : '',
      providerName: json['serviceProviderName'],
      providerImg: json['providerImg'],
      notes: json['notes'],
      deliveryTime: json['deliverytime'],
      images: images,
      time: date,
      video: videoUrl,
    );
  }

  AllServicesEntity toEntity() {
    return AllServicesEntity(
      id: id,
      name: name,
      desc: desc,
      price: price,
      img: img,
      providerName: providerName,
      providerImg: providerImg,
      time: time,
      notes: notes,
      images: images,
      deliveryTime: deliveryTime,
      video: video,
    );
  }
}
