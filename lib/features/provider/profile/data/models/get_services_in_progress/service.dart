import 'request_service.dart';

class InProgressService {
  List<dynamic>? providerServices;
  List<RequestService>? requestServices;

  InProgressService({this.providerServices, this.requestServices});

  factory InProgressService.fromJson(Map<String, dynamic> json) =>
      InProgressService(
        providerServices: json['providerServices'] as List<dynamic>?,
        requestServices: (json['requestServices'] as List<dynamic>?)
            ?.map((e) => RequestService.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'providerServices': providerServices,
        'requestServices': requestServices?.map((e) => e.toJson()).toList(),
      };
}
