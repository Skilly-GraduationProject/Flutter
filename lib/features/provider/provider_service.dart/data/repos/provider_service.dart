import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grad_project/core/helper/api_service.dart';
import 'package:grad_project/core/utils/networking/api_constatnts.dart';
import 'package:grad_project/core/utils/networking/errors/failure.dart';
import 'package:grad_project/core/utils/networking/errors/server_failure.dart';
import 'package:grad_project/features/provider/home/data/models/provider_profile/provider.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_gallery_model/servicesgallery.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_services_model/service.dart';

class ProviderServiceRepo {
  final ApiService apiService;
  ProviderServiceRepo({required this.apiService});

  Future<Either<Failure, ProviderService>> getProviderService(
      String serviceId) async {
    try {
      final response = await apiService.get(
        "${ApiConstants.baseUrl}Provider/ProviderServices/GetServiceBy/$serviceId",
      );
      ProviderService providerService =
          ProviderService.fromJson(response.data["service"]);
      return right(providerService);
    } on DioException catch (e) {
      ServerFailure serverFailure = ServerFailure.fromDioError(dioException: e);
      return left(serverFailure);
    }
  }

  Future<Either<Failure, String>> addGalleryService(
      GalleryService galleryService) async {
    try {
      FormData data = FormData.fromMap(await galleryService.toJson());
      final response = await apiService.post(
          "${ApiConstants.baseUrl}Provider/Servicegallery/AddGallery", data);
      return right("");
    } on DioException catch (e) {
      print("errrrrror $e");
      ServerFailure serverFailure = ServerFailure.fromDioError(dioException: e);
      return left(serverFailure);
    }
  }

  Future<Either<Failure, GalleryService>> getGalleryService(
      String serviceId) async {
    try {
      final response = await apiService.get(
        "${ApiConstants.baseUrl}Provider/Servicegallery/GetGalleryBy/$serviceId",
      );
      print(response);
      GalleryService providerService =
          GalleryService.fromJson(response.data["gallery"]);
      return right(providerService);
    } on DioException catch (e) {
      print("errrrrror $e");
      ServerFailure serverFailure = ServerFailure.fromDioError(dioException: e);
      return left(serverFailure);
    }
  }

  Future<Either<Failure, String>> deleteGalleryService(String serviceId) async {
    try {
      final response = await apiService.delete(
          "${ApiConstants.baseUrl}Provider/Servicegallery/DeleteGalleryBy/$serviceId",
          {});
      return right(response.data["message"]);
    } on DioException catch (e) {
      ServerFailure serverFailure = ServerFailure.fromDioError(dioException: e);
      return left(serverFailure);
    }
  }

  Future<Either<Failure, String>> deleteService(String serviceId) async {
    try {
      final response = await apiService.delete(
          "${ApiConstants.baseUrl}Provider/ProviderServices/DeleteServiceBy/$serviceId",
          {});
      return right(response.data["message"]);
    } on DioException catch (e) {
      ServerFailure serverFailure = ServerFailure.fromDioError(dioException: e);
      return left(serverFailure);
    }
  }

  Future<Either<Failure, String>> updateService(ProviderService service) async {
    try {
      final formData = FormData.fromMap(await service.toJson());
      final response = await apiService.put(
        endPoint:
            "${ApiConstants.baseUrl}Provider/ProviderServices/EditServiceBy/${service.id}",
        data: formData,
      );
      return right(response.data["message"]);
    } on DioException catch (e) {
      print(e.response);
      ServerFailure serverFailure = ServerFailure.fromDioError(dioException: e);
      return left(serverFailure);
    }
  }
}
