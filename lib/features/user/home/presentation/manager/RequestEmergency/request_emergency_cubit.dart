import 'package:bloc/bloc.dart';

import '../../../../../../core/helper/shared_prefrences.dart';
import '../../../domain/usecases/request_emergency_usecase.dart';
import 'request_emergency_states.dart';

class RequestEmergencyCubit extends Cubit<RequestEmergencyStates> {
  RequestEmergencyCubit(this.requestEmergencyUseCase)
      : super(RequestEmergencyInitial());
  final RequestEmergencyUseCase requestEmergencyUseCase;

  Future<String?> requestEmergency(
    String categoryId,
    String desc,
  ) async {
    final token = await loadToken();
    emit(RequestEmergencyInitial());

    var result = await requestEmergencyUseCase.call(
      token: token!,
      categoryId: categoryId,
      desc: desc,
    );
    return result.fold((failure) {
      emit(RequestEmergencyFailure(failure.errMessage));
      return null;
    }, (requestId) {
      emit(RequestEmergencySuccess(requestId));
      return requestId;
    });
  }
}
