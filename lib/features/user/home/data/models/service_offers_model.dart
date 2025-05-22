import '../../domain/entities/all_service_offers.dart';

class ServiceOffersModel {
  final String 
      notes,
      id,
      providerName,
      providerImg,
      deliveryTime;
  final double price;

  ServiceOffersModel({
    required this.notes,
    required this.id,
    required this.price,
    required this.providerName,
    required this.providerImg,
    required this.deliveryTime,
  });

  factory ServiceOffersModel.fromJson(Map<String, dynamic> json) {


    return ServiceOffersModel(
      id: json['id'],
      price: json['salary'],
      providerName: json['userName'],
      providerImg: json['userImg'],
      notes: json['notes'],
      deliveryTime: json['deliverytime'],
    );
  }

  AllServiceOffersEntity toEntity() {
    return AllServiceOffersEntity(
      id: id,
      price: price,
      providerName: providerName,
      providerImg: providerImg,
      notes: notes,
      deliveryTime: deliveryTime,
    );
  }
}
