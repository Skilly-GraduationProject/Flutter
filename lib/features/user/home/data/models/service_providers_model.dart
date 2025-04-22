import '../../domain/entities/service_providers_entity.dart';

class ServiceProvidersModel {
  final String id;
  final String firstName;
  final String lastName;
  final String img;

  ServiceProvidersModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.img,
  });

  factory ServiceProvidersModel.fromJson(Map<String, dynamic> json) {
    return ServiceProvidersModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      img: json['img'],
    );
  }

  ServiceProvidersEntity toEntity() {
    return ServiceProvidersEntity(
      id: id,
      fullName: '$firstName $lastName',
      img: img,
    );
  }
}
