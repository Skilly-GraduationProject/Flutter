import 'package:bloc/bloc.dart';
import '../../../domain/usecases/get_all_services_usecase.dart';
import 'get_all_services_states.dart';

class GetAllServicesCubit extends Cubit<GetAllServicesStates> {
  GetAllServicesCubit(this.getAllServicesUseCase)
      : super(GetAllServicesInitial());
  final GetAllServicesUseCase getAllServicesUseCase;

  Future<void> getAllServices(String? sort) async {
    emit(GetAllServicesLoading());
    var result = await getAllServicesUseCase.call(sort);
    result.fold((failure) {
      emit(GetAllServicesFailure(failure.errMessage));
    }, (providers) {
      emit(GetAllServicesSuccess(providers));
    });
  }
}
