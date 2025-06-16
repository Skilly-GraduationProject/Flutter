import '../../domain/entities/user_profile_data_entity.dart';

class UserProfileDataModel {
  final String id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String governorate;
  final String city;
  final String streetName;
  final int gender;
  final int points;
  final String img;
  final String userId;

  UserProfileDataModel({
    required this.points,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.governorate,
    required this.city,
    required this.streetName,
    required this.gender,
    required this.img,
    required this.userId,
  });

  factory UserProfileDataModel.fromJson(Map<String, dynamic> json) {
    return UserProfileDataModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      governorate: json['governorate'],
      city: json['city'],
      streetName: json['streetName'],
      gender: json['gender'],
      points: json['points'],
      img: json['img'],
      userId: json['userId'],
    );
  }

  UserProfileDataEntity toEntity() {
    return UserProfileDataEntity(
      points: points,
      name: '$firstName $lastName',
      phone: phoneNumber,
      email: email,
      city: city,
      streetName: streetName,
      img: img,
    );
  }
}
