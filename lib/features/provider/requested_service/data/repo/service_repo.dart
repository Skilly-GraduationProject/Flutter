import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grad_project/core/helper/api_service.dart';
import 'package:grad_project/core/utils/networking/errors/server_failure.dart';
import 'package:grad_project/features/provider/home/data/models/get_requested_services_model/get_requested_services_model.dart';
import 'package:grad_project/features/provider/home/data/models/get_requested_services_model/service.dart';
import 'package:grad_project/features/provider/requested_service/data/models/add_service_model/add_service_model.dart';
import 'package:grad_project/features/provider/requested_service/data/models/add_service_model/data.dart';
import 'package:grad_project/features/provider/requested_service/data/models/offer_model.dart';
import 'package:grad_project/features/provider/requested_service/data/models/offer_model/send_offer_model.dart';
import 'package:grad_project/features/provider/requested_service/presentation/widgets/send_offer_dialog.dart';

import '../../../../../core/utils/networking/api_constatnts.dart';

class ServiceRepo {
  final ApiService apiService;
  ServiceRepo({required this.apiService});
  Future<Either<ServerFailure, RequestedService>> getRequestedService({
    required String serviceId,
  }) async {
    try {
      final response = await apiService.get(
        "${ApiConstants.baseUrl}${ApiConstants.getRequestedServiceById}$serviceId",
      );
      RequestedService requestedService =
          RequestedService.fromJson(response.data["service"]);
      return Right(requestedService);
    } on DioException catch (e) {
      print(e.response);
      return Left(ServerFailure.fromDioError(
        dioException: e,
      ));
    }
  }

  Future<Either<ServerFailure, AddServiceModel>> addService({
    required AddedService serviceModel,
  }) async {
    try {
      final formDataMap = await serviceModel.toJson();
      print('FormData being sent: $formDataMap');

      final formData = FormData.fromMap(
        formDataMap,
      );
      final response = await apiService.post(
        "${ApiConstants.baseUrl}${ApiConstants.addService}",
        formData,
        isMultipart: true,
      );
      return Right(AddServiceModel.fromJson(response.data));
    } on DioException catch (e) {
      print('DioException in addService: ${e.message}');
      print('Response data: ${e.response?.data}');
      print('Response status: ${e.response?.statusCode}');
      return Left(ServerFailure.fromDioError(
        dioException: e,
      ));
    } catch (e) {
      print('General exception in addService: $e');
      return Left(ServerFailure(
        errMessage: 'An unexpected error occurred: $e',
      ));
    }
  }

  Future<Either<ServerFailure, String>> sendOffer({
    required SendOfferModel offerModel,
  }) async {
    try {
      final response = await apiService.post(
        "${ApiConstants.baseUrl}${ApiConstants.sendOffer}",
        offerModel.toJson(),
      );
      print(response.data);
      return Right(response.data['message']);
    } on DioException catch (e) {
      print(e.response);
      return Left(ServerFailure.fromDioError(
        dioException: e,
      ));
    }
  }

  Future<Either<ServerFailure, OfferModel>> getOffer({
    required String offerId,
  }) async {
    try {
      final response = await apiService.get(
        "${ApiConstants.baseUrl}${ApiConstants.getOfferById}$offerId",
      );
      OfferModel offer = OfferModel.fromJson(response.data["offer"]);
      return Right(offer);
    } on DioException catch (e) {
      print(e.response);
      return Left(ServerFailure.fromDioError(
        dioException: e,
      ));
    }
  }

  Future<Either<ServerFailure, String>> acceptOffer({
    required String offerId,
  }) async {
    try {
      final response = await apiService.post(
        "${ApiConstants.baseUrl}${ApiConstants.acceptOffer}$offerId",
        {},
      );
      return Right(response.data['message'] ?? 'Offer accepted successfully');
    } on DioException catch (e) {
      print(e.response);
      return Left(ServerFailure.fromDioError(
        dioException: e,
      ));
    }
  }

  Future<Either<ServerFailure, String>> rejectOffer({
    required String offerId,
  }) async {
    try {
      final response = await apiService.post(
        "${ApiConstants.baseUrl}${ApiConstants.rejectOffer}$offerId",
        {},
      );
      return Right(response.data['message'] ?? 'Offer rejected successfully');
    } on DioException catch (e) {
      print(e.response);
      return Left(ServerFailure.fromDioError(
        dioException: e,
      ));
    }
  }

  Future<Either<ServerFailure, String>> acceptService({
    required String requestId,
  }) async {
    try {
      final response = await apiService.post(
        "${ApiConstants.baseUrl}${ApiConstants.acceptService}$requestId",
        {},
      );
      return Right(response.data['message'] ?? 'Service accepted successfully');
    } on DioException catch (e) {
      print(e.response);
      return Left(ServerFailure.fromDioError(
        dioException: e,
      ));
    }
  }
}
