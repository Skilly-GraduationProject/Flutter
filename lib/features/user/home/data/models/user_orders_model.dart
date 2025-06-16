import '../../domain/entities/user_orders_entity.dart';

class UserOrdersModel {
  final String name, id, categoryId, startDate, deliveryTime;
  final double price;
  final int offersCount;
  final List<String>? images;
  final String? video, notes, img;

  UserOrdersModel({
    required this.name,
    required this.price,
    required this.offersCount,
    required this.id,
    required this.categoryId,
    required this.deliveryTime,
    required this.startDate,
    this.img,
    this.video,
    this.notes,
    this.images,
  });

  factory UserOrdersModel.fromJson(Map<String, dynamic> json) {
    final List<String>? images = (json['images'] as List<dynamic>?)
        ?.map((e) => e['img'].toString())
        .toList();

    String? firstImg;
    if (images != null && images.isNotEmpty) {
      firstImg = images.firstWhere((e) => e.trim().isNotEmpty);
    } else {
      firstImg = null;
    }

    return UserOrdersModel(
        categoryId: json['categoryId'],
        startDate: json['startDate'],
        id: json['id'],
        offersCount: json['offersCount'],
        name: json['name'],
        price: json['price'],
        notes: json['notes'],
        deliveryTime: json['deliverytime'],
        images: images,
        img: firstImg,
        video: json['video'].toString());
  }

  UserOrdersEntity toEntity() {
    return UserOrdersEntity(
        categoryId: categoryId,
        deliveryTime: deliveryTime,
        startDate: startDate,
        id: id,
        offersCount: offersCount,
        name: name,
        notes: notes,
        price: price,
        images: images,
        img: img,
        video: video);
  }
}
