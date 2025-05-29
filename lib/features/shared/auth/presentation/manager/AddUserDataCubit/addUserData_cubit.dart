import 'package:bloc/bloc.dart';

import '../../../domain/usecases/addUserData_usecase.dart';
import 'addUserData_states.dart';

class AddUserDataCubit extends Cubit<AddUserDataState> {
  AddUserDataCubit(this.addUserDataUseCase) : super(AddUserDataInitial());
  final AddUserDataUseCase addUserDataUseCase;

  Future<void> addUserData(String govern, String city, String streetName,
      String image, int gender,String token) async {
    emit(AddUserDataInitial());

    try {
      // var result = await addUserDataUseCase.call(
      //     govern: govern,
      //     city: city,
      //     streetName: streetName,
      //     gender: gender,
      //     image: image);
      print('add user data cubit success');
      emit(AddUserDataSuccess());
    } catch (error) {
      print('add user data cubit fails');
      emit(AddUserDataFailure(error.toString()));
    }
  }
}
