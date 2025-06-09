import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grad_project/features/user/home/domain/entities/all_services_entity.dart';
import '../../../../../constants.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/helper/api_service.dart';
import '../../domain/entities/category_entitiy.dart';
import '../../domain/entities/category_item_entity.dart';
import '../../domain/entities/offered_services_entity.dart';
import '../../domain/entities/service_providers_entity.dart';
import '../../domain/repos/user_repo.dart';
import '../models/all_services_model.dart';
import '../models/category_item_model.dart';
import '../models/offered_services_model.dart';
import '../models/service_providers_model.dart';

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

  @override
  Future<Either<Failure, List<ServiceProvidersEntity>>>
      getCategoryServiceProviders({required String categoryId}) async {
    try {
      final response = await apiService
          .get('$baseUrl/Provider/GetAllServiceProvidersBy/$categoryId');
      final Map<String, dynamic> data = response.data;
      print('data $data');
      final providers = data['provider'] as List;
      final provider = providers
          .map((json) => ServiceProvidersModel.fromJson(json).toEntity())
          .toList();

      return Right(provider);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OfferedServicesEntity>>> getCategoryServices(
      {required String categoryId}) async {
    try {
      final response = await apiService.get(
          '$baseUrl/Provider/ProviderServices/GetAllServicesBy/$categoryId');
      final Map<String, dynamic> data = response.data;
      print('data $data');
      final services = data['service'] as List;
      final service = services
          .map((json) => OfferedServicesModel.fromJson(json).toEntity())
          .toList();

      return Right(service);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AllServicesEntity>>> getAllServices() async {
    try {
      final response = await apiService
          .get('$baseUrl/Provider/ProviderServices/getAllServices');
      final Map<String, dynamic> data = response.data;
      print('data $data');
      final services = data['services'] as List;
      final service = services
          .map((json) => AllServicesModel.fromJson(json).toEntity())
          .toList();

      return Right(service);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
