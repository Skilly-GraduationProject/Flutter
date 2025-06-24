import 'service.dart';

class GetServicesInProgress {
  InProgressService? service;

  GetServicesInProgress({this.service});

  factory GetServicesInProgress.fromJson(Map<String, dynamic> json) {
    return GetServicesInProgress(
      service: json['service'] == null
          ? null
          : InProgressService.fromJson(json['service'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'service': service?.toJson(),
      };
}
