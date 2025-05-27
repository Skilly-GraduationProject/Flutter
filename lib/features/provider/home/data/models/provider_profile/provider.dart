class Provider {
  String? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? governorate;
  String? city;
  String? streetName;
  String? age;
  int? gender;
  String? img;
  String? profession;
  String? numberOfYearExperience;
  String? briefSummary;
  String? nationalNumberPdf;
  String? userId;
  String? categoryId;
  double? review;

  Provider({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.governorate,
    this.city,
    this.streetName,
    this.age,
    this.gender,
    this.img,
    this.profession,
    this.numberOfYearExperience,
    this.briefSummary,
    this.nationalNumberPdf,
    this.userId,
    this.categoryId,
    this.review,
  });

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        id: json['id'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        email: json['email'] as String?,
        governorate: json['governorate'] as String?,
        city: json['city'] as String?,
        streetName: json['streetName'] as String?,
        age: json['age'].toString() as String?,
        gender: json['gender'] as int?,
        img: json['img'] as String?,
        profession: json['profession'] as String?,
        numberOfYearExperience:
            json['numberOfYearExperience'].toString() as String?,
        briefSummary: json['briefSummary'] as String?,
        nationalNumberPdf: json['nationalNumberPDF'] as String?,
        userId: json['userId'] as String?,
        categoryId: json['categoryId'] as String?,
        review: json['review'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'email': email,
        'governorate': governorate,
        'city': city,
        'streetName': streetName,
        'age': age,
        'gender': gender,
        'img': img,
        'profession': profession,
        'numberOfYearExperience': numberOfYearExperience,
        'briefSummary': briefSummary,
        'nationalNumberPDF': nationalNumberPdf,
        'userId': userId,
        'categoryId': categoryId,
        'review': review,
      };
}
