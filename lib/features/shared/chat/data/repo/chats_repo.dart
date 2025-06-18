import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grad_project/core/helper/api_service.dart';
import 'package:grad_project/core/utils/networking/api_constatnts.dart';
import 'package:grad_project/core/utils/networking/errors/failure.dart';
import 'package:grad_project/core/utils/networking/errors/server_failure.dart';
import 'package:grad_project/features/shared/chat/data/models/get_chat_model/chat_message.dart';
import 'package:grad_project/features/shared/chat/data/models/get_chats_info_model/get_chats_model.dart';
import 'package:grad_project/features/shared/chat/data/models/get_chat_model/get_chat_model.dart';

class ChatsRepo {
  final ApiService apiService;
  ChatsRepo({required this.apiService});

  Future<Either<Failure, GetChatsModel>> getChats() async {
    try {
      final response = await apiService
          .get("${ApiConstants.baseUrl}${ApiConstants.getChats}");
      GetChatsModel getChatsModel = GetChatsModel.fromJson(response.data);
      return right(getChatsModel);
    } on DioException catch (e) {
      ServerFailure serverFailure = ServerFailure.fromDioError(dioException: e);
      return left(serverFailure);
    }
  }

  Future<Either<Failure, GetChatModel>> getChat(
      {required String chatId}) async {
    try {
      final response = await apiService.get(
        "${ApiConstants.baseUrl}${ApiConstants.getChat}/$chatId",
      );
      GetChatModel getChatModel = GetChatModel.fromJson(response.data);
      return right(getChatModel);
    } on DioException catch (e) {
      ServerFailure serverFailure = ServerFailure.fromDioError(dioException: e);
      return left(serverFailure);
    }
  }

  Future<Either<Failure, dynamic>> sendMessage({
    required String receiverId,
    String? message,
    String? image,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "receiverId": receiverId,
        "content": message,
        if (image != null) "img": await MultipartFile.fromFile(image),
      });
      final response = await apiService.post(
          "${ApiConstants.baseUrl}${ApiConstants.sendMessage}", formData);
      // You can replace 'dynamic' with a specific model if you have one for the response
      return right(response.data);
    } on DioException catch (e) {
      ServerFailure serverFailure = ServerFailure.fromDioError(dioException: e);
      return left(serverFailure);
    }
  }
}
