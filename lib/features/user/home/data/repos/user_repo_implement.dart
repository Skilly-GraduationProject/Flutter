import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../constants.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/helper/api_service.dart';
import '../../domain/entities/category_entitiy.dart';
import '../../domain/entities/category_item_entity.dart';
import '../../domain/repos/user_repo.dart';
import '../models/category_item_model.dart';

class UserRepoImplement implements UserRepo {
  final ApiService apiService;
  UserRepoImplement({required this.apiService});

  @override
  Future<Either<Failure, CategoryEntity>> getAllCategories() async {
    try {
      final response = await apiService.get(
        '$baseUrl/Category/getAllCategories',
      );
      if (response.data is Map<String, dynamic>) {
        final Map<String, dynamic> data = response.data;
        print('data $data');
        final List<dynamic> items = data['categories'] ?? [];
        List<CategoryItemEntity> categories = items.map((item) {
          return CategoryItemModel.fromJson(item as Map<String, dynamic>);
        }).toList();
        print('Category $categories');
        final CategoryEntity category = CategoryEntity(
          categories: categories,
        );
        return right(category);
      } else {
        throw Exception('Invalid response format');
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
 
}
