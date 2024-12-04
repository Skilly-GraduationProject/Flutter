
import 'package:bloc/bloc.dart';

import '../../../domain/usecases/resetPass_usecase.dart';

part 'resetPass_states.dart';

class ResetPassCubit extends Cubit<UpdatePassState> {
  ResetPassCubit(this.resetPssUseCase) : super(UpdatePassInitial());
  final ResetPassUseCase resetPssUseCase;

  Future<void> updatePass(
      {required String pass,
      required String confirmPass,
      required String email}) async {
    emit(UpdatePassLoading());
    try {
      await resetPssUseCase.call(
          pass: pass, confirmPass: confirmPass, email: email);
      emit(UpdatePassSuccess());
    } catch (e) {
      emit(UpdatePassFailure(e.toString()));
    }
  }
}
