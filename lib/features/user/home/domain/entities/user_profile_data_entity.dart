class UserProfileDataEntity {
  final String name, img, city, streetName, email, phone;
  final int points;

  UserProfileDataEntity({
    required this.points,
    required this.name,
    required this.img,
    required this.city,
    required this.email,
    required this.phone,
    required this.streetName,
  });
}
