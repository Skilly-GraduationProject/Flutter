import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/features/shared/chat/data/models/get_chats_model/get_chats_model.dart';

class ChatsState {
  final CubitState? getChatsState;
  final GetChatsModel? chatsModel;
  ChatsState({
    this.getChatsState,
    this.chatsModel,
  });
  ChatsState editState({CubitState? chatsState, GetChatsModel? chatsModel}) {
    return ChatsState(
        getChatsState: chatsState ?? getChatsState,
        chatsModel: chatsModel ?? this.chatsModel);
  }
}
