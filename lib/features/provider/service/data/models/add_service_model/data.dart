import 'package:dio/dio.dart';

class AddedService {
  String? name;
  String? description;
  String? deliverytime;
  String? notes;
  int? price;
  List<dynamic>? images;
  String? categoryId;

  AddedService({
    this.name,
    this.description,
    this.deliverytime,
    this.notes,
    this.price,
    this.images,
    this.categoryId,
  });

  factory AddedService.fromJson(Map<String, dynamic> json) => AddedService(
        name: json['name'] as String?,
        description: json['description'] as String?,
        deliverytime: json['deliverytime'] as String?,
        notes: json['notes'] as String?,
        price: json['price'] as int?,
        images: json['images'] as List<dynamic>?,
        categoryId: json['categoryId'] as String?,
      );

  Future<Map<String, dynamic>> toJson() async => {
        'name': name,
        'description': description,
        'deliverytime': deliverytime,
        'notes': notes,
        'price': price,
        'images': await Future.wait(
          images!.map(
            (image) => MultipartFile.fromFile(
              image,
            ),
          ),
        ),
        'categoryId': "40f5f9df-a11b-4a90-b89c-2bd01b33c420",
      };
}
