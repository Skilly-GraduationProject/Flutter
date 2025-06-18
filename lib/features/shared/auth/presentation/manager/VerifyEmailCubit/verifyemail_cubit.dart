import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/verify_email_usecase.dart';
import 'verifyemail_states.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit(this.verifyEmailUseCase) : super(VerifyEmailInitial());
  final VerifyEmailUseCase verifyEmailUseCase;

  Future<void> verifyEmail(
      {required String code, required String email}) async {
    emit(VerifyEmailLoading());
    try {
      await verifyEmailUseCase.call(code: code, email: email);
      print('verify email cubit success');
      emit(VerifyEmailSuccess());
    } catch (e) {
      print('verify email cubit fails $e');
      emit(VerifyEmailFailure('Failed to Verify Email:${e.toString()}'));
    }
  }
}
