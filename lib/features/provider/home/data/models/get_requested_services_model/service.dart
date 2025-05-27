import 'package:grad_project/core/helper/date_formatter.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_services_model/service.dart';

class RequestedService {
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
  String? userImg;
  List<ImageModel>? images;
  List<dynamic>? offerSalaries;

  RequestedService({
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
    this.userImg,
    this.images = const [],
    this.offerSalaries,
  });

  factory RequestedService.fromJson(Map<String, dynamic> json) =>
      RequestedService(
        id: json['id'] as String?,
        name: json['name'] as String?,
        price: json['price'] as double?,
        deliverytime: json['deliverytime'] as String?,
        startDate: json['startDate'] as String?,
        serviceRequestTime:
            DateFormatter.formatDate(json['serviceRequestTime']) as String?,
        categoryId: json['categoryId'] as String?,
        notes: json['notes'] as String?,
        userId: json['userId'] as String?,
        userName: json['userName'] as String?,
        userImg: json['userImg'] as String?,
        images: json['images'] != null
            ? (json['images'] as List)
                .map((image) =>
                    ImageModel.fromJson(image as Map<String, dynamic>))
                .toList()
            : [],
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
        'userImg': userImg,
        'images': images,
        'offerSalaries': offerSalaries,
      };
}
