import 'package:grad_project/core/helper/date_formatter.dart';

class Service {
  String? id;
  String? name;
  String? user;
  double? price;
  String? deliverytime;
  String? startDate;
  String? serviceRequestTime;
  String? categoryId;
  String? notes;
  String? userId;
  String? userName;
  List<dynamic>? requestServiceImages;
  List<dynamic>? offerSalaries;

  Service({
    this.id,
    this.name,
    this.price,
    this.deliverytime,
    this.startDate,
    this.serviceRequestTime,
    this.categoryId,
    this.notes,
    this.userId,
    this.userName,
    this.requestServiceImages,
    this.offerSalaries,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json['id'] as String?,
        name: json['name'] as String?,
        price: json['price'] as double?,
        deliverytime: json['deliverytime'] as String?,
        startDate: json['startDate'] as String?,
        serviceRequestTime: DateFormatter.formatDate(json['serviceRequestTime']) as String?,
        categoryId: json['categoryId'] as String?,
        notes: json['notes'] as String?,
        userId: json['userId'] as String?,
        userName: json['userName'] as String?,
        requestServiceImages: json['requestServiceImages'] ,
        offerSalaries: json['offerSalaries'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'deliverytime': deliverytime,
        'startDate': startDate,
        'categoryId': categoryId,
        'notes': notes,
        'userId': userId,
        'requestServiceImages': requestServiceImages,
        'offerSalaries': offerSalaries,
      };
}
