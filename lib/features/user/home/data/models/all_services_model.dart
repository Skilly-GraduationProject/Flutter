import '../../domain/entities/all_services_entity.dart';

class AllServicesModel {
  final String name, desc, img, time, providerName, providerImg;
  final String? notes;
  final List<String> images;
  final double price;

  AllServicesModel(
      {required this.name,
      required this.desc,
      required this.price,
      required this.img,
      required this.providerName,
      required this.time,
      required this.notes,
      required this.images,
      // required this.deliveryTime,
      required this.providerImg});
  factory AllServicesModel.fromJson(Map<String, dynamic> json) {
    final List<String>images =  (json['images'] as List<dynamic>).map((e) => e.toString()).toList();
    final time = json['serviceRequestTime'];
    final date = time.split('T').first;
    return AllServicesModel(
        name: json['name'],
        desc: json['description'],
        price: json['price'],
        img: images.first,
        providerName: json['serviceProviderName'],
        providerImg: json['providerImg'],
        notes: json['notes'],
        images: images,
        // deliveryTime: json['deliveryTime'],
        time: date);
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
      // deliveryTime: deliveryTime,
      notes: notes,
      images: images
    );
  }
}
