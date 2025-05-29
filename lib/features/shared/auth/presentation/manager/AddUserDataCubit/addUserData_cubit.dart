import 'dart:io';

import 'package:bloc/bloc.dart';

import '../../../domain/usecases/addUserData_usecase.dart';
import 'addUserData_states.dart';

class AddUserDataCubit extends Cubit<AddUserDataState> {
  AddUserDataCubit(this.addUserDataUseCase) : super(AddUserDataInitial());
  final AddUserDataUseCase addUserDataUseCase;

  Future<void> addUserData(
    String govern,
    String city,
    String streetName,
    File image,
    int gender,
    String token,
  ) async {
    emit(AddUserDataInitial());
    try {
      var result = await addUserDataUseCase.call(
        token: token,
        govern: govern,
        city: city,
        streetName: streetName,
        gender: gender,
        image: image,
      );
      print('add user cubit success $result');

      emit(AddUserDataSuccess());
    } catch (error) {
      print('add provider data cubit fails $error');
      emit(AddUserDataFailure(error.toString()));
    }
  }
}
