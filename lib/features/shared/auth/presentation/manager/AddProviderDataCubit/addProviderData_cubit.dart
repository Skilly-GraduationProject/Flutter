import 'package:bloc/bloc.dart';

import '../../../domain/usecases/addProviderData_usecase.dart';
import 'addProviderData_states.dart';

class AddProviderDataCubit extends Cubit<AddProviderDataState> {
  AddProviderDataCubit(this.addProviderDataUseCase) : super(AddProviderDataInitial());
  final AddProviderDataUseCase addProviderDataUseCase;

  Future<void> addProviderData() async {
    emit(AddProviderDataInitial());
    try {
      print('add provider data cubit success');
      emit(AddProviderDataSuccess());
    } catch (error) {
      print('add provider data cubit fails');
      emit(AddProviderDataFailure(error.toString()));
    }
  }
}
