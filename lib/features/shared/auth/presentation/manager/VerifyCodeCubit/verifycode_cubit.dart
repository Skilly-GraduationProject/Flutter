import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/verify_usecase.dart';
import 'verifycode_states.dart';

class VerifycodeCubit extends Cubit<VerifyCodeState> {
  VerifycodeCubit(this.verifyUseCase) : super(VerifyCodeInitial());
  final VerifyUseCase verifyUseCase;

  Future<void> verify({required String code, required String email}) async {
    emit(VerifyCodeLoading());
    try {
      await verifyUseCase.call(code: code, email: email);
       print('verify cubit success');
      emit(VerifyCodeSuccess());
    } catch (e) {
       print('verify cubit fails $e');
      emit(VerifyCodeFailure('Failed to Verify Code:${e.toString()}'));
    }
  }
}
