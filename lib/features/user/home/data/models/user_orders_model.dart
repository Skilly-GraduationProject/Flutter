
import '../../domain/entities/user_orders_entity.dart';

class UserOrdersModel {
  final String name, desc;
  final List<String> images;
  final double price;


  UserOrdersModel({
    required this.name,
    required this.desc,
    required this.images,
    required this.price

  });

  factory UserOrdersModel.fromJson(Map<String, dynamic> json) {
     final List<String>images = (json['images'] as List<dynamic>).map((e) => e.toString()).toList();

    return UserOrdersModel(
      name: json['name'],
      desc: json['notes'],
      price: json['price'],
      images:images ,
  
    );
  }

  UserOrdersEntity toEntity() {
    return UserOrdersEntity(
      name: name,
      desc: desc,
      price: price,
      images: images,
    );
  }
}
