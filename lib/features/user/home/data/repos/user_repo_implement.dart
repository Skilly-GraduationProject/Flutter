import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grad_project/features/user/home/domain/entities/all_services_entity.dart';
import 'package:grad_project/features/user/home/domain/entities/get_banners_entitiy.dart';
import 'package:grad_project/features/user/home/domain/entities/user_orders_entity.dart';
import 'package:grad_project/features/user/home/domain/entities/user_profile_data_entity.dart';
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
import '../models/get_banners_model.dart';
import '../models/offered_services_model.dart';
import '../models/service_providers_model.dart';
import '../models/user_orders_model.dart';
import '../models/user_profile_data_model.dart';

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

  @override
  Future<Either<Failure, UserProfileDataEntity>> getUserProfileData(
      {required String token}) async {
    try {
      final response = await apiService.get(
          '$baseUrl/UserProfile/userProfile/GetUserProfileByuserId',
          token: token);
      final Map<String, dynamic> data = response.data;
      print('data $data');
      final userData = UserProfileDataModel.fromJson(data['user']).toEntity();

      return Right(userData);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UserOrdersEntity>>> getUserOrders(
      {required String token}) async {
    try {
      final response = await apiService.get(
          '$baseUrl/UserProfile/requestServices/GetAllRequestsByuserId',
          token: token);
      final Map<String, dynamic> data = response.data;
      print('data $data');
      final services = data['services'] as List;
      final orders = services
          .map((json) => UserOrdersModel.fromJson(json).toEntity())
          .toList();

      return Right(orders);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GetBannersEntity>>> getBanners() async {
    try {
      final response = await apiService.get(
        '$baseUrl/Banner/GetAllBanners',
      );
      final Map<String, dynamic> data = response.data;
      print('data $data');
      final banners = data['banners'] as List;
      final banner = banners
          .map((json) => GetBannersModel.fromJson(json).toEntity())
          .toList();

      return Right(banner);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> requestService(
      {required String name,
      required String deliveryTime,
      required String notes,
      required String video,
      required double price,
      required String category,
      required String startDate}) async {
    final response = await apiService.post(
      '$baseUrl/UserProfile/requestServices/AddrequestService',
      {
        "name": name,
        "price": price,
        "deliverytime": deliveryTime,
        "startDate": startDate,
        "categoryId": "40f5f9df-a11b-4a90-b89c-2bd01b33c420",
        "notes": notes,
        "images": []
      },
    );
    print('response ${response.data}');
    return response.data;
  }


//       {required String serviceId,
//       required double price,
//       required String duration,
//       required String notes}) async {
//     final response = await apiService.post(
//       '$baseUrl/OfferSalary/AddOffer',
//       {
//         "salary": price,
//         "deliverytime": duration,
//         "notes": notes,
//         "serviceId": serviceId
//       },
//     );
//     print('add offer response ${response.data}');
//     return response.data;
//   }
  @override
  Future<Either<Failure, void>> addOffer({
    required String serviceId,
    required double price,
    required String duration,
    required String notes,
    required String token,
  }) async {
    try {
      final response = await apiService.post(
        '$baseUrl/OfferSalary/AddOffer',
        token:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImFiOTVlZDI2LTAzODAtNGMzMC05Y2M4LTU0MjRlN2U3YmY5NCIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL21vYmlsZXBob25lIjoiMDEyMjE2NDMxOTUiLCJqdGkiOiI3M2IzMDk0YS0xZDQyLTQwZmEtYThmNC1mMGQ2MGE4NGU4NTciLCJleHAiOjE3NDg1MzExOTQsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI3MSIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCJ9.HFe0kcwr0MUpBNBjWWRC2U3I-7E5Iob5z_dvrcGgTGg',
        {
          "salary": price,
          "deliverytime": duration,
          "notes": notes,
          "serviceId": serviceId,
        },
      );
      print('add offer response ${response.data}');
      return right(null); 
    } catch (e) {
      print('add offer error: $e');
      return left(ServerFailure(e.toString()));
    }
  }
}
