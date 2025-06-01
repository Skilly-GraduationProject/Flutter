import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/features/shared/chat/data/models/get_chats_info_model/get_chats_model.dart';
import 'package:grad_project/features/shared/chat/data/models/get_chat_model/chat_message.dart';

class ChatsState {
  final CubitState? getChatsState;
  final GetChatsModel? chatsModel;
  final CubitState? getChatState;
  final List<ChatMessage>? messages;
  final CubitState? sendMessageState;

  ChatsState({
    this.getChatsState,
    this.chatsModel,
    this.getChatState,
    this.messages,
    this.sendMessageState,
  });

  ChatsState editState({
    CubitState? chatsState,
    GetChatsModel? chatsModel,
    CubitState? getChatState,
    List<ChatMessage>? messages,
    CubitState? sendMessageState,
  }) {
    return ChatsState(
      getChatsState: chatsState ?? getChatsState,
      chatsModel: chatsModel ?? this.chatsModel,
      getChatState: getChatState ?? this.getChatState,
      messages: messages ?? this.messages,
      sendMessageState: sendMessageState ?? this.sendMessageState,
    );
  }
}