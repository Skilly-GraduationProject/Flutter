
import '../../domain/entities/discount_services_entity.dart';

class DiscountServicesModel {
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
  final double discountPrice;
  final double price;

  DiscountServicesModel({
    required this.discountPrice,
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

  factory DiscountServicesModel.fromJson(Map<String, dynamic> json) {
    final List<String> images =
        (json['images'] as List<dynamic>).map((e) => e.toString()).toList();

    String? videoUrl;
    if (images.isNotEmpty && images.last.toLowerCase().endsWith('.mp4')) {
      videoUrl = images.last;
      images.removeLast();
    }

    final time = json['serviceRequestTime'];
    final date = time.split('T').first;

    return DiscountServicesModel(
      discountPrice: json['priceDiscount'],
      id: json['id'],
      name: json['name'],
      desc: json['description'],
      price: json['price'],
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

  DiscountServicesEntity toEntity() {
    return DiscountServicesEntity(
      id: id,
      name: name,
      desc: desc,
      price: price,
      discountPrice: discountPrice,
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
