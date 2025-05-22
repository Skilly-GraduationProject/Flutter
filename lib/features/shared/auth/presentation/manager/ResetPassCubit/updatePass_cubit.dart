import 'package:bloc/bloc.dart';

import '../../../domain/usecases/updatePass_usecase.dart';

part 'updatePass_states.dart';

class UpdatePassCubit extends Cubit<UpdatePassState> {
  UpdatePassCubit(this.updatePassUseCase) : super(UpdatePassInitial());
  final UpdatePassUseCase updatePassUseCase;

  Future<void> updatePass(
      {required String pass,
      required String confirmPass,
      required String email}) async {
    emit(UpdatePassLoading());
    try {
      await updatePassUseCase.call(
          pass: pass, confirmPass: confirmPass, email: email);
      print('update pass cubit success');
      emit(UpdatePassSuccess());
    } catch (e) {
      print('update pass cubit fails');
      emit(UpdatePassFailure(e.toString()));
    }
  }
}
