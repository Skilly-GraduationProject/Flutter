import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grad_project/core/helper/api_service.dart';
import 'package:grad_project/core/utils/networking/errors/server_failure.dart';
import 'package:grad_project/features/provider/home/data/models/get_requested_services_model/get_requested_services_model.dart';
import 'package:grad_project/features/provider/home/data/models/home_banners/home_banners.dart';
import 'package:grad_project/features/provider/home/data/models/provider_profile/provider_profile.dart';

import '../../../../../core/utils/networking/api_constatnts.dart';

class ProviderHomeRepo {
  final ApiService apiService;

  ProviderHomeRepo({required this.apiService});
  Future<Either<ServerFailure, ProviderProfileModel>>
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

  Future<Either<ServerFailure, GetRequestedServicesModel>>
      getRequestedServices() async {
    try {
      var response = await apiService
          .get(ApiConstants.baseUrl + ApiConstants.getRequestedServices);
      GetRequestedServicesModel model =
          GetRequestedServicesModel.fromJson(response.data);
      return Right(model);
    } on DioException catch (e) {
      print(e.response?.data);
      ServerFailure serverFailure = ServerFailure.fromDioError(dioException: e);
      return Left(serverFailure);
    }
  }

  Future<Either<ServerFailure, HomeBanners>> getHomeBanners() async {
    try {
      var response = await apiService
          .get(ApiConstants.baseUrl + ApiConstants.getHomeBanners);
      HomeBanners model = HomeBanners.fromJson(response.data);
      return Right(model);
    } on DioException catch (e) {
      print(e.response?.data);
      ServerFailure serverFailure = ServerFailure.fromDioError(dioException: e);
      return Left(serverFailure);
    }
  }
}
