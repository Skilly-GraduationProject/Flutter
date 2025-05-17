import 'provider.dart';

class ProviderProfileModel {
  Provider? provider;

  ProviderProfileModel({this.provider});

  factory ProviderProfileModel.fromJson(Map<String, dynamic> json) {
    return ProviderProfileModel(
      provider: json['provider'] == null
          ? null
          : Provider.fromJson(json['provider'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'provider': provider?.toJson(),
      };
}
