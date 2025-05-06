import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grad_project/core/helper/api_service.dart';
import 'package:grad_project/core/utils/networking/api_constatnts.dart';
import 'package:grad_project/core/utils/networking/errors/server_failure.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_services_model/get_my_services_model.dart';

class ProviderDataRepo {
  final ApiService apiService;
  ProviderDataRepo({required this.apiService});
  Future<Either<ServerFailure,GetMyServicesModel>> getMyServices()async{
    try {
  var response = await apiService.get(ApiConstants.baseUrl + ApiConstants.getMyServices);
  GetMyServicesModel model = GetMyServicesModel.fromJson(response.data);
  return right(model);
} on DioException catch (e) {
  ServerFailure failure = ServerFailure.fromDioError(dioException: e);
  return left(failure);
}
  }
}
