import 'package:bloc/bloc.dart';

import '../../../data/models/auth_response.dart';
import '../../../domain/usecases/login_usecase.dart';
part 'login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  final LoginUseCase loginUseCase;

  Future<void> login(String phone, String password, bool rememeber) async {
    emit(LoginInitial());

    try {
      var result = await loginUseCase.call(
          phone: phone, password: password, remember: rememeber);
      emit(LoginSuccess(result));
      print('login cubit success ${result.token}');
    } catch (error) {
      emit(LoginFailure(error.toString()));
      print('login cubit fails');
    }
  }
}
