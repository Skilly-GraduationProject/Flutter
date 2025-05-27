import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grad_project/core/helper/api_service.dart';
import 'package:grad_project/core/utils/networking/api_constatnts.dart';
import 'package:grad_project/core/utils/networking/errors/failure.dart';
import 'package:grad_project/core/utils/networking/errors/server_failure.dart';
import 'package:grad_project/features/shared/chat/data/models/get_chats_model/get_chats_model.dart';

class ChatsRepo {
  final ApiService apiService;
  ChatsRepo({required this.apiService});
  Future<Either<Failure, GetChatsModel>> getChats() async {
    try {
      final response = await apiService.get("${ApiConstants.baseUrl}${ApiConstants.getChats}");
      GetChatsModel getChatsModel = GetChatsModel.fromJson(response.data);
      return right(getChatsModel);
    } on DioException catch (e) {
      ServerFailure serverFailure = ServerFailure.fromDioError(dioException: e);
      return left(serverFailure);
    }
  }
}
