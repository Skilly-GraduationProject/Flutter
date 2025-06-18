import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grad_project/core/helper/api_service.dart';
import 'package:grad_project/core/utils/networking/errors/server_failure.dart';
import 'package:grad_project/features/shared/notifications/data/models/get_notifications_model/get_notifications_model.dart';

import '../../../../../core/utils/networking/api_constatnts.dart';

class NotificationsRepo {
  ApiService apiService;
  NotificationsRepo({required this.apiService});

  Future<Either<ServerFailure, GetNotificationsModel>>
      getNotifications() async {
    try {
      final response = await apiService.get(
        "${ApiConstants.baseUrl}${ApiConstants.getNotifications}",
      );
      GetNotificationsModel getNotificationsModel =
          GetNotificationsModel.fromJson(response.data);
      return Right(getNotificationsModel);
    } on DioException catch (e) {
      print("respooonse $e");
      ServerFailure serverFailure = ServerFailure.fromDioError(dioException: e);
      return Left(serverFailure);
    }
  }

  Future<Either<ServerFailure, String>> deleteNotification(
      {required String notificationId}) async {
    try {
      final response = await apiService.delete(
        "${ApiConstants.baseUrl}${ApiConstants.deleteNotification}/$notificationId",
        {},
        // params: {
        //   "notificationId": notificationId,
        // },
      );

      return Right(response.data["message"] ?? "");
    } on DioException catch (e) {
      print("respooonse $e");
      ServerFailure serverFailure = ServerFailure.fromDioError(dioException: e);
      return Left(serverFailure);
    }
  }
}
