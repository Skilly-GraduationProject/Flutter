import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grad_project/core/helper/api_service.dart';
import 'package:grad_project/core/utils/networking/api_constatnts.dart';
import 'package:grad_project/core/utils/networking/errors/server_failure.dart';
import 'package:grad_project/features/provider/home/data/models/provider_profile/provider_profile.dart';
import 'package:grad_project/features/provider/profile/data/models/edit_profile_model.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_gallery_model/get_my_gallery_model.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_services_model/get_my_services_model.dart';
import 'package:grad_project/features/provider/profile/data/models/get_reviews_model/get_reviews_model.dart';

class ProviderDataRepo {
  final ApiService apiService;
  ProviderDataRepo({required this.apiService});
        getProviderProfile() async {
    try {
      var response = await apiService
          .get(ApiConstants.baseUrl + ApiConstants.getProviderProfile);
      ProviderProfileModel model = ProviderProfileModel.fromJson(response.data);
      return Right(model);
    } on DioException catch (e) {
      print(e.response?.data);
      ServerFailure serverFailure = ServerFailure.fromDioError(dioException: e);
      return Left(serverFailure);
    }
  }
  Future<Either<ServerFailure, GetMyServicesModel>> getMyServices() async {
    try {
      var response = await apiService
          .get(ApiConstants.baseUrl + ApiConstants.getMyServices);
      GetMyServicesModel model = GetMyServicesModel.fromJson(response.data);
      return right(model);
    } on DioException catch (e) {
      ServerFailure failure = ServerFailure.fromDioError(dioException: e);
      return left(failure);
    }
  }

  Future<Either<ServerFailure, GetMyGalleryModel>> getGallery() async {
    try {
      var response = await apiService
          .get(ApiConstants.baseUrl + ApiConstants.getMyGallery);
      GetMyGalleryModel model = GetMyGalleryModel.fromJson(response.data);
      return right(model);
    } on DioException catch (e) {
      ServerFailure failure = ServerFailure.fromDioError(dioException: e);
      return left(failure);
    }
  }

  Future<Either<ServerFailure, GetReviewsModel>> getMyReviews() async {
    try {
      var response = await apiService
          .get(ApiConstants.baseUrl + ApiConstants.getMyReviews);
      GetReviewsModel model = GetReviewsModel.fromJson(response.data);
      return right(model);
    } on DioException catch (e) {
      ServerFailure failure = ServerFailure.fromDioError(dioException: e);
      return left(failure);
    }
  }

  Future<Either<ServerFailure, EditProfileModel>> editProfile(
      EditProfileModel editProfileModel) async {
    try {
      FormData formData = FormData.fromMap(await editProfileModel.toJson());
      var response = await apiService.put(
          endPoint: ApiConstants.baseUrl + ApiConstants.editProviderProfile,
          data: formData);
      EditProfileModel model = EditProfileModel.fromJson(response.data["data"]);
      return right(model);
    } on DioException catch (e) {
      print(e.response);
      ServerFailure failure = ServerFailure.fromDioError(dioException: e);
      return left(failure);
    }
  }
}
