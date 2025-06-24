import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class AddedService {
  String? name;
  String? description;
  String? deliverytime;
  String? notes;
  int? price;
  List<dynamic>? images;
  String? categoryId;
  dynamic? video;

  AddedService({
    this.name,
    this.description,
    this.deliverytime,
    this.notes,
    this.price,
    this.images,
    this.categoryId,
    this.video,
  });

  factory AddedService.fromJson(Map<String, dynamic> json) => AddedService(
        name: json['name'] as String?,
        description: json['description'] as String?,
        deliverytime: json['deliverytime'] as String?,
        notes: json['notes'] as String?,
        price: json['price'] as int?,
        images: json['images'] as List<dynamic>?,
        categoryId: json['categoryId'] as String?,
        video: json['video'] as dynamic?,
      );

  Future<Map<String, dynamic>> toJson() async {
    print('AddedService.toJson() called with:');
    print('name: $name');
    print('description: $description');
    print('deliverytime: $deliverytime');
    print('notes: $notes');
    print('price: $price');
    print('images count: ${images?.length ?? 0}');
    print('video: $video');
    print('categoryId: $categoryId');

    final Map<String, dynamic> data = {
      'name': name,
      'description': description,
      'deliverytime': deliverytime,
      'notes': notes,
      'price': price,
      'categoryId': "40f5f9df-a11b-4a90-b89c-2bd01b33c420",
    };

    // Handle images if they exist
    if (images != null && images!.isNotEmpty) {
      print('Processing ${images!.length} images...');
      data['images'] = await Future.wait(
        images!.map(
          (image) => MultipartFile.fromFile(
            image,
          ),
        ),
      );
      print('Images processed successfully');
    } else {
      print('No images to process');
    }

    // Handle video if it exists
    if (video != null) {
      // final mimeType =
      //     lookupMimeType(video!)?.split('/') ?? [, ];
      print('Processing video: $video');
      data['video'] = await MultipartFile.fromFile(
        video!,
        filename: video!.split('/').last,
        contentType: MediaType('video', 'mp4'),
      );
      print('Video processed successfully');
    } else {
      print('No video to process');
    }

    print('Final data map: $data');
    return data;
  }
}
