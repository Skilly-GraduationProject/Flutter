import 'package:bloc/bloc.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/features/shared/chat/data/repo/chats_repo.dart';
import 'package:grad_project/features/shared/chat/presentation/manager/cubit/chats_state.dart';
import 'package:meta/meta.dart';



class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit({required this.chatsRepo}) : super(ChatsState());
  final ChatsRepo chatsRepo;

  Future<void> getChats() async {
    emit(state.editState(chatsState: CubitState.loading));
    final response = await chatsRepo.getChats();
    response.fold((failure) {
      emit(state.editState(chatsState: CubitState.failure, chatsModel: null));
    }, (chatsModel) {
      emit(state.editState(chatsState: CubitState.success, chatsModel: chatsModel));
    });
  }
}
