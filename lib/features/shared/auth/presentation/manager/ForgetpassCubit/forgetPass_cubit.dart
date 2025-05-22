import 'package:bloc/bloc.dart';

import '../../../domain/usecases/forgetPass_usecase.dart';
part 'forgetPass_states.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  ForgetPassCubit(this.forgetPassUseCase) : super(ForgetPassInitial());
  final ForgetPassUseCase forgetPassUseCase;

  Future<void> forgetPass({required String email}) async {
    emit(ForgetPassLoading());
    try {
      await forgetPassUseCase.call(email: email);
      print('cubit ${forgetPassUseCase.call(email: email)}');
      emit(ForgetPassSuccess());
    } catch (e) {
      emit(ForgetPassFailure('Failed to send reset pass'));
    }
  }
}
