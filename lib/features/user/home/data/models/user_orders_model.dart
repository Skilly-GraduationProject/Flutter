import '../../domain/entities/user_orders_entity.dart';

class UserOrdersModel {
  final String name, desc, id;
  final List<String>? images;
  final String? video;
  final int offersCount;
  final double price;

  UserOrdersModel(
      {required this.name,
      this.video,
      required this.desc,
      required this.images,
      required this.price,
      required this.offersCount,
      required this.id});

  factory UserOrdersModel.fromJson(Map<String, dynamic> json) {
    final List<String> images = (json['images'] as List<dynamic>)
        .map((e) => e['img'].toString())
        .toList();

    return UserOrdersModel(
        id: json['id'],
        offersCount: json['offersCount'],
        name: json['name'],
        desc: json['notes'],
        price: json['price'],
        images: images,
        video: json['video'].toString());
  }

  UserOrdersEntity toEntity() {
    return UserOrdersEntity(
        id: id,
        offersCount: offersCount,
        name: name,
        desc: desc,
        price: price,
        images: images,
        video: video);
  }
}
