import 'data.dart';

class AddServiceModel {
  String? message;
  AddedService? data;

  AddServiceModel({this.message, this.data});

  factory AddServiceModel.fromJson(Map<String, dynamic> json) {
    return AddServiceModel(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : AddedService.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data?.toJson(),
      };
}
