import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grad_project/features/user/home/domain/entities/all_services_entity.dart';
import 'package:grad_project/features/user/home/domain/entities/get_banners_entitiy.dart';
import 'package:grad_project/features/user/home/domain/entities/user_orders_entity.dart';
import 'package:grad_project/features/user/home/domain/entities/user_profile_data_entity.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import '../../../../../constants.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/helper/api_service.dart';
import '../../domain/entities/all_service_offers._entity.dart';
import '../../domain/entities/category_entitiy.dart';
import '../../domain/entities/category_item_entity.dart';
import '../../domain/entities/emergency_providers_entity.dart';
import '../../domain/entities/service_reviews_entity.dart';
import '../../domain/entities/service_providers_entity.dart';
import '../../domain/repos/user_repo.dart';
import '../models/all_services_model.dart';
import '../models/category_item_model.dart';
import '../models/emergency_providers_model.dart';
import '../models/get_banners_model.dart';
import '../models/service_offers_model.dart';
import '../models/service_providers_model.dart';
import '../models/service_reviews_model.dart';
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
  Future<Either<Failure, List<AllServicesEntity>>> getCategoryServices(
      {required String categoryId, required String token, String? sort}) async {
    try {
      final response = await apiService.get(
        '$baseUrl/Provider/ProviderServices/GetAllServicesBy/$categoryId',
        token: token,
        queryParameters: sort != null ? {'sort': sort} : null,
      );
      final Map<String, dynamic> data = response.data;
      print('data $data');
      final services = data['service'] as List;
      final service = services
          .map((json) => AllServicesModel.fromJson(json).toEntity())
          .toList();

      return Right(service);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AllServicesEntity>>> getAllServices(
      {required String token, String? sort}) async {
    try {
      final response = await apiService.get(
        '$baseUrl/Provider/ProviderServices/getAllServices',
        token: token,
        queryParameters: sort != null ? {'sort': sort} : null,
      );
      print('Requesting with sort = $sort');
      print('Full URI: ${response.requestOptions.uri}');
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
        token: token,
      );

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
  Future<Either<Failure, void>> requestService({
    required String token,
    required String deliveryTime,
    required String name,
    required String notes,
    required String category,
    required File? video,
    required String startDate,
    required List<File>? images,
    required double price,
  }) async {
    final formData = FormData.fromMap({
      'Name': name,
      'Price': price.toInt(),
      'Deliverytime': deliveryTime,
      'startDate': startDate,
      'categoryId': category,
      'Notes': notes,
    });
    if (images != null && images.isNotEmpty) {
      for (var image in images) {
        final mimeType =
            lookupMimeType(image.path)?.split('/') ?? ['image', 'png'];
        formData.files.add(
          MapEntry(
            'Images',
            await MultipartFile.fromFile(
              image.path,
              filename: image.path.split('/').last,
              contentType: MediaType(mimeType[0], mimeType[1]),
            ),
          ),
        );
      }
    }
    if (video != null) {
      final mimeType =
          lookupMimeType(video.path)?.split('/') ?? ['video', 'mp4'];
      formData.files.add(
        MapEntry(
          'Video',
          await MultipartFile.fromFile(
            video.path,
            filename: video.path.split('/').last,
            contentType: MediaType(mimeType[0], mimeType[1]),
          ),
        ),
      );
    }
try{
    final response = await apiService.post(
      '$baseUrl/UserProfile/requestServices/AddrequestService',
      formData,
      token: token,
    );
    print('response ${response.data}');
     return right(null);
    } catch (e) {
      print('request service error: $e');
      return left(ServerFailure(e.toString()));
    }
 
  }

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

  @override
  Future<Either<Failure, void>> buyService(
      {required String token,
      required String serviceId,
      required String startDate}) async {
    try {
      final response = await apiService.post(
        '$baseUrl/OfferSalary/AddOffer',
        token:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImFiOTVlZDI2LTAzODAtNGMzMC05Y2M4LTU0MjRlN2U3YmY5NCIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL21vYmlsZXBob25lIjoiMDEyMjE2NDMxOTUiLCJqdGkiOiI3M2IzMDk0YS0xZDQyLTQwZmEtYThmNC1mMGQ2MGE4NGU4NTciLCJleHAiOjE3NDg1MzExOTQsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI3MSIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCJ9.HFe0kcwr0MUpBNBjWWRC2U3I-7E5Iob5z_dvrcGgTGg',
        {
          "startDate": startDate,
          "serviceId": serviceId,
        },
      );
      print('buy service response ${response.data}');
      return right(null);
    } catch (e) {
      print('buy service error: $e');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AllServiceOffersEntity>>> getServiceOffers(
      {required String token, required String serviceId}) async {
    try {
      final response = await apiService
          .get('$baseUrl/OfferSalary/getAllOffersBy/$serviceId', token: token);
      final Map<String, dynamic> data = response.data;
      print('data $data');
      final services = data['offers'] as List;
      final offers = services
          .map((json) => ServiceOffersModel.fromJson(json).toEntity())
          .toList();

      return Right(offers);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ServiceReviewsEntity>>> getServiceReviews(
      {required String token, required String serviceId}) async {
    try {
      final response = await apiService.get(
          '$baseUrl/Provider/Review/GetReviewsBy/$serviceId',
          token: token);
      final Map<String, dynamic> data = response.data;
      print('data $data');
      final services = data['reviews']['reviews'] as List;
      final reviews = services
          .map((json) => ServiceReviewsModel.fromJson(json).toEntity())
          .toList();

      return Right(reviews);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> requestEmergency(
      {required String token,
      required String categoryId,
      required String desc}) async {
    try {
      final response = await apiService.post(
        '$baseUrl/Emergency/create-emergency-request',
        token: token,
        {
          "categoryId": categoryId,
          "problemDescription": desc,
        },
      );
      final Map<String, dynamic> data = response.data;
      final requestId = data['requestId'];
      print('request emergency response $data');
      return right(requestId);
    } catch (e) {
      print('request emergency error: $e');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<EmergencyProvidersEntity>>> getEmergencyProviders(
      {required String token, required String requestId}) async {
    try {
      final response = await apiService.get(
        '$baseUrl/Emergency/nearby-providers/$requestId',
        token: token,
      );
      final Map<String, dynamic> data = response.data;
      print('data $data');
      final services = data["result"] as List;
      final offers = services
          .map((json) => EmergencyProvidersModel.fromJson(json).toEntity())
          .toList();

      return Right(offers);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> startPayment(
      {required String token, required String serviceId}) async {
    try {
      final response = await apiService.post(
        '$baseUrl/Payment/start-payment',
        token: token,
        {
          "serviceId": serviceId,
        },
      );
      final data = response.data;
      print('start payment response ${response.data}');

      if (data['result'] != null && data['result']['iframeUrl'] != null) {
        final String paymentUrl = data['result']['iframeUrl'];
        return right(paymentUrl);
      } else {
        return left(ServerFailure('لم يتم العثور على رابط الدفع في الاستجابة'));
      }
    } catch (e) {
      print('start payment error: $e');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> applyDiscount(
      {required String token, required String serviceId}) async {
    try {
      final response = await apiService.post(
          '$baseUrl/Provider/ProviderServices/apply-Discount/$serviceId',
          token: token,
          {});
      print('apply discount response ${response.data}');
      return right(null);
    } catch (e) {
      print('apply discount error: $e');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> acceptOffer(
      {required String token, required String offerId}) async {
    try {
      final response = await apiService
          .post('$baseUrl/OfferSalary/AcceptOffer/$offerId', token: token, {});
      print('accept offer response ${response.data}');
      return right(null);
    } catch (e) {
      print('accept offer error: $e');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> rejectOffer(
      {required String token, required String offerId}) async {
    try {
      final response = await apiService
          .post('$baseUrl/OfferSalary/RejectOffer/$offerId', token: token, {});
      print('reject offer response ${response.data}');
      return right(null);
    } catch (e) {
      print('reject offer error: $e');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> acceptEOffer(
      {required String token,
      required String requestId,
      required String providerId}) async {
    try {
      final response = await apiService
          .post('$baseUrl/Emergency/accept-offer', token: token, {
        "requestId": requestId,
        "providerId": providerId,
      });
      print('accept E offer response ${response.data}');
      return right(null);
    } catch (e) {
      print('accept E offer error: $e');
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> rejectEOffer(
      {required String token,
      required String requestId,
      required String providerId}) async {
    try {
      final response = await apiService
          .post('$baseUrl/Emergency/reject-offer', token: token, {
        "requestId": requestId,
        "providerId": providerId,
      });
      print('reject E offer response ${response.data}');
      return right(null);
    } catch (e) {
      print('reject E offer error: $e');
      return left(ServerFailure(e.toString()));
    }
  }
}
