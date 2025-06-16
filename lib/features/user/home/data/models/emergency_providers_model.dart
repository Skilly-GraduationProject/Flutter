
import '../../domain/entities/emergency_providers_entity.dart';

class EmergencyProvidersModel {
  final String 
  requestId,
      providerId,
      providerName,
      providerImg,
      deliveryTime,
      rate,
      profession;
  final double price;

  EmergencyProvidersModel({
    required this.requestId,
    required this.providerId,
    required this.price,
    required this.providerName,
    required this.providerImg,
    required this.deliveryTime,
      required this.rate,
    required this.profession,
  });

  factory EmergencyProvidersModel.fromJson(Map<String, dynamic> json) {


    return EmergencyProvidersModel(
      requestId: json['requestId'],
      providerId: json['id'],
      price: json['price'],
      providerName: json['name'],
      providerImg: json['imageUrl'],
     profession: json['categoryName'],
     rate: json['review'],
      deliveryTime: json['estimatedTimeFormatted'],
    );
  }

  EmergencyProvidersEntity toEntity() {
    return EmergencyProvidersEntity(
      providerId: providerId,
      requestId: requestId,
      price: price,
     img: providerImg,
     name: providerName,
     profession: profession,
     rate: rate,
      deliveryTime: deliveryTime,
    );
  }
}
