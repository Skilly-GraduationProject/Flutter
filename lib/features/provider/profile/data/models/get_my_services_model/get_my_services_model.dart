import 'service.dart';

class GetMyServicesModel {
  List<ProviderService>? service;

  GetMyServicesModel({this.service});

  factory GetMyServicesModel.fromJson(Map<String, dynamic> json) {
    return GetMyServicesModel(
      service: (json['service'] as List<dynamic>?)
          ?.map((e) => ProviderService.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'service': service?.map((e) => e.toJson()).toList(),
      };
}
