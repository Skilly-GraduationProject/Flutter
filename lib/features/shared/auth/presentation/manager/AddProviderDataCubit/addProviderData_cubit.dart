import 'dart:io';

import 'package:bloc/bloc.dart';

import '../../../domain/usecases/addProviderData_usecase.dart';
import 'addProviderData_states.dart';

class AddProviderDataCubit extends Cubit<AddProviderDataState> {
  AddProviderDataCubit(this.addProviderDataUseCase)
      : super(AddProviderDataInitial());
  final AddProviderDataUseCase addProviderDataUseCase;

  Future<void> addProviderData(
      String govern,
      String city,
      String streetName,
      File image,
      File pdf,
      int gender,
      int age,
      String brief,
      String token,
      int yearsOfExpert,
      String categoryId) async {
    emit(AddProviderDataInitial());
    try {
      var result = await addProviderDataUseCase.call(
        token: token,
          govern: govern,
          city: city,
          streetName: streetName,
          age: age,
          yearsOfExp: yearsOfExpert,
          gender: gender,
          image: image,
          pdf: pdf,
          categoryId: categoryId,
          briefSummary: brief,
         );
      print('add provider cubit success $result');
 
      emit(AddProviderDataSuccess());
    } catch (error) {
      print('add provider data cubit fails $error');
      emit(AddProviderDataFailure(error.toString()));
    }
  }
}
