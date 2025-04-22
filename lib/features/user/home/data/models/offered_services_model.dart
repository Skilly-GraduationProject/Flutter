import '../../domain/entities/offered_services_entity.dart';

class OfferedServicesModel {
  final String name, desc;
  final double price;

  OfferedServicesModel({
    required this.name,
    required this.desc,
    required this.price,
  });
  factory OfferedServicesModel.fromJson(Map<String, dynamic> json) {
    return OfferedServicesModel(
      name: json['name'],
      desc: json['description'],
      price: json['price'],
    );
  }

  OfferedServicesEntity toEntity() {
    return OfferedServicesEntity(
      name: name,
      desc: desc,
      price: price,
    );
  }
}
