import 'package:bloc/bloc.dart';
import '../../../domain/usecases/register_usecase.dart';
part 'register_states.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());
  final RegisterUseCase registerUseCase;

  Future<void> register(String firstName, String secondName, String email,
      String password, String phone, int userType) async {
    emit(RegisterInitial());

    try {
      await registerUseCase.call(
        firstName: firstName,
        secondName: secondName,
        email: email,
        password: password,
        phone: phone,
        userType: userType,
      );
      print('register cubit success');
      emit(RegisterSuccess());
    } catch (error) {
      print('register cubit fails $error');
      emit(RegisterFailure(error.toString()));
    }
  }
}
