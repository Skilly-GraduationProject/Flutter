import 'service.dart';

class GetRequestedServicesModel {
  List<Service>? services;

  GetRequestedServicesModel({this.services});

  factory GetRequestedServicesModel.fromJson(Map<String, dynamic> json) {
    return GetRequestedServicesModel(
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'services': services?.map((e) => e.toJson()).toList(),
      };
}
