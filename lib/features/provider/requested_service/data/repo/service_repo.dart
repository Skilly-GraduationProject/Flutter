import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grad_project/core/helper/api_service.dart';
import 'package:grad_project/core/utils/networking/errors/server_failure.dart';
import 'package:grad_project/features/provider/requested_service/data/models/add_service_model/add_service_model.dart';
import 'package:grad_project/features/provider/requested_service/data/models/add_service_model/data.dart';
import 'package:grad_project/features/provider/requested_service/data/models/offer_model/send_offer_model.dart';
import 'package:grad_project/features/provider/requested_service/presentation/widgets/send_offer_dialog.dart';

import '../../../../../core/utils/networking/api_constatnts.dart';

class ServiceRepo {
  final ApiService apiService;
  ServiceRepo({required this.apiService});
  Future<Either<ServerFailure, AddServiceModel>> addService({
    required AddedService serviceModel,
  }) async {
    try {
      final formData = FormData.fromMap(await serviceModel.toJson());
      final response = await apiService.post(
        "${ApiConstants.baseUrl}${ApiConstants.addService}",
        formData,
      );
      return Right(AddServiceModel.fromJson(response.data));
    } on DioException catch (e) {
      print(e.response);
      return Left(ServerFailure.fromDioError(
        dioException: e,
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
}
