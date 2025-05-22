import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/verify_code_usecase.dart';
import 'verifycode_states.dart';

class VerifycodeCubit extends Cubit<VerifyCodeState> {
  VerifycodeCubit(this.verifyCodeUseCase) : super(VerifyCodeInitial());
  final VerifyCodeUseCase verifyCodeUseCase;

  Future<void> verifyCode({required String code, required String email}) async {
    emit(VerifyCodeLoading());
    try {
      await verifyCodeUseCase.call(code: code, email: email);
       print('verify code cubit success');
      emit(VerifyCodeSuccess());
    } catch (e) {
       print('verify code cubit fails $e');
      emit(VerifyCodeFailure('Failed to Verify Code:${e.toString()}'));
    }
  }
}
