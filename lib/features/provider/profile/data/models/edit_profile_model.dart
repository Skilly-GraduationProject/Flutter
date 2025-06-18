import 'package:dio/dio.dart';

class EditProfileModel {
  String? governorate;
  String? city;
  String? streetName;
  int? age;
  int? gender;
  String? img;
  int? numberOfYearExperience;
  String? briefSummary;
  dynamic nationalNumberPdf;
  String? categoryId;

  EditProfileModel({
    this.governorate,
    this.city,
    this.streetName,
    this.age,
    this.gender,
    this.img,
    this.numberOfYearExperience,
    this.briefSummary,
    this.nationalNumberPdf,
    this.categoryId,
  });

  factory EditProfileModel.fromJson(Map<String, dynamic> json) {
    return EditProfileModel(
      governorate: json['governorate'] as String?,
      city: json['city'] as String?,
      streetName: json['streetName'] as String?,
      age: json['age'] as int?,
      gender: json['gender'] as int?,
      img: json['img'] as dynamic,
      numberOfYearExperience: json['numberOfYearExperience'] as int?,
      briefSummary: json['briefSummary'] as String?,
      nationalNumberPdf: json['nationalNumberPDF'] as dynamic,
      categoryId: json['categoryId'] as String?,
    );
  }

  Future<Map<String, dynamic>> toJson() async {
    return {
      if (governorate != null) 'governorate': governorate,
      if (city != null) 'city': city,
      if (streetName != null) 'streetName': streetName,
      if (age != null) 'age': age,
      if (gender != null) 'gender': gender,
      if (img != null)
        'img': img != null ? await MultipartFile.fromFile(img!) : null,
      if (numberOfYearExperience != null)
        'numberOfYearExperience': numberOfYearExperience,
      if (briefSummary != null) 'briefSummary': briefSummary,
      if (nationalNumberPdf != null) 'nationalNumberPDF': nationalNumberPdf,
      if (categoryId != null) 'categoryId': categoryId,
    };
  }
}
