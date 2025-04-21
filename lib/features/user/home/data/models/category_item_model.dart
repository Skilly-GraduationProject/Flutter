

import '../../domain/entities/category_item_entity.dart';

class CategoryItemModel extends CategoryItemEntity {
  String? categoryId;
  String? categoryName;
  String? categoryImg;

  CategoryItemModel({
    this.categoryId,
    this.categoryName,
    this.categoryImg,
  
  }) : super(
            id: categoryId!,
            name: categoryName!,
            img: categoryImg!,
          );

  factory CategoryItemModel.fromJson(Map<String, dynamic> json) => CategoryItemModel(
       categoryId: json['id'] as String?,
        categoryName: json['name'] as String?,
        categoryImg: json['img'] as String?,
       
      );

  Map<String, dynamic> toJson() => {
        'id': categoryId,
        'name': categoryName,
        'img': categoryImg,
       
      };
}