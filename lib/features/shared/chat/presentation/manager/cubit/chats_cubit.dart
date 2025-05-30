import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:grad_project/core/keys.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/features/shared/chat/data/repo/chats_repo.dart';
import 'package:grad_project/features/shared/chat/presentation/manager/cubit/chats_state.dart';
import 'package:grad_project/features/shared/chat/data/models/get_chat_model/chat_message.dart';
import 'package:grad_project/core/helper/socket_helper.dart';
import 'package:meta/meta.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit({required this.chatsRepo}) : super(ChatsState());
  final ChatsRepo chatsRepo;
  final SocketHelper _socketHelper = SocketHelper();
  StreamSubscription? _messageSubscription;

  void setupSocketListener() {
    _socketHelper.connect();
    _socketHelper.onEvent("ReceiveMessage").listen((data) {
      ChatMessage message =
          ChatMessage(senderId: data[0], content: data[1], img: data[2]);
      emit(state.editState(sendMessageState: CubitState.loading));
      final currentMessages = List<ChatMessage>.from(state.messages ?? []);

      if (message.senderId != Keys.userId) {
        currentMessages.add(message);
        emit(state.editState(messages: currentMessages));
      }
    });
  }

  @override
  Future<void> close() {
    _messageSubscription?.cancel();
    _socketHelper.disconnect();
    return super.close();
  }

  Future<void> getChats() async {
    emit(state.editState(chatsState: CubitState.loading));
    final response = await chatsRepo.getChats();
    response.fold((failure) {
      emit(state.editState(chatsState: CubitState.failure, chatsModel: null));
    }, (chatsModel) {
      emit(state.editState(
          chatsState: CubitState.success, chatsModel: chatsModel));
    });
  }

  Future<void> getChat({required String chatId}) async {
    emit(state.editState(getChatState: CubitState.loading));
    final response = await chatsRepo.getChat(chatId: chatId);
    response.fold(
      (failure) {
        emit(state.editState(getChatState: CubitState.failure, messages: null));
      },
      (chatModel) {
        emit(state.editState(
          getChatState: CubitState.success,
          messages: chatModel.chatMessages,
        ));
      },
    );
  }

  Future<void> sendMessage({
    required String receiverId,
    required String? message,
    String? image,
  }) async {
    emit(state.editState(sendMessageState: CubitState.loading));
    final currentMessages = List<ChatMessage>.from(state.messages ?? []);
    final localMessage = ChatMessage(
      id: UniqueKey().toString(), // or use a uuid generator
      senderId: Keys.userId, // replace with actual sender id if available
      receiverId: receiverId,
      content: message,
      img: image,
    );
    currentMessages.add(localMessage);
    emit(state.editState(messages: currentMessages));

    final response = await chatsRepo.sendMessage(
      receiverId: receiverId,
      message: message,
      image: image,
    );
    response.fold(
      (failure) {
        emit(state.editState(sendMessageState: CubitState.failure));
        // Optionally, remove the local message or mark as failed
      },
      (result) {
        emit(state.editState(sendMessageState: CubitState.success));
        // Optionally, update the local message with server data
      },
    );
  }

  closeChat() {
    _socketHelper.disconnect();
    emit(state.editState(messages: []));
  }
}
