import 'package:bloc/bloc.dart';
import 'package:grad_project/features/user/home/domain/usecases/get_emergency_providers_usecase.dart';
import 'get_emergency_providers_states.dart';

class GetEmergencyProvidersCubit extends Cubit<GetEmergencyProvidersStates> {
  GetEmergencyProvidersCubit(this.getEmergencyProvidersUseCase)
      : super(GetEmergencyProvidersInitial());
  final GetEmergencyProvidersUseCase getEmergencyProvidersUseCase;

  Future<void> getEmergencyProviders(String requestId) async {
    emit(GetEmergencyProvidersLoading());
    var result = await getEmergencyProvidersUseCase.call(requestId: requestId);
    result.fold((failure) {
      emit(GetEmergencyProvidersFailure(failure.errMessage));
    }, (offers) {
      emit(GetEmergencyProvidersSuccess(offers));
    });
  }
}
