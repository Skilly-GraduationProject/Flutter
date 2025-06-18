import '../../domain/entities/category_item_entity.dart';

class CategoryItemModel extends CategoryItemEntity {
  String? categoryId;
  String? categoryName;
  String? categoryImg;
  String? professionName;

  CategoryItemModel(
      {this.categoryId,
      this.categoryName,
      this.categoryImg,
      this.professionName})
      : super(
          id: categoryId!,
          name: categoryName!,
          img: categoryImg!,
          professionName: professionName!,
        );

  factory CategoryItemModel.fromJson(Map<String, dynamic> json) =>
      CategoryItemModel(
        categoryId: json['id'] as String?,
        categoryName: json['name'] as String?,
        categoryImg: json['img'] as String?,
        professionName: json['professionName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': categoryId,
        'name': categoryName,
        'img': categoryImg,
        'professionName': professionName,
      };
}
