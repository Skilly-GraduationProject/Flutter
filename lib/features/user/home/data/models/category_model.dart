import 'category_item_model.dart';

class CategoryModel {
  List<CategoryItemModel>? categories;

  CategoryModel({this.categories});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categories: (json['categories'] as List<dynamic>)
          .map((item) =>
              CategoryItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'categories': categories?.map((e) => e.toJson()).toList(),
      };
  // CategoryEntity toEntity() {
  //   return CategoryEntity(id: id, name: name, img: img);
  // }
}
