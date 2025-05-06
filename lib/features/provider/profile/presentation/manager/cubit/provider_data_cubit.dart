import 'package:bloc/bloc.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/features/provider/profile/data/repos/provider_data_repo.dart';
import 'package:grad_project/features/provider/profile/presentation/manager/cubit/provider_data_state.dart';

class ProviderDataCubit extends Cubit<ProviderDataState> {
  ProviderDataCubit({required this.repo}) : super(ProviderDataState());
  final ProviderDataRepo repo;

  Future<void> getMyServices() async {
    emit(state.editState(getMyServicesState: CubitState.loading));
    final result = await repo.getMyServices();
    result.fold(
        (l) => emit(state.editState(getMyServicesState: CubitState.failure)),
        (r) => emit(state.editState(
            getMyServicesState: CubitState.success, getMyServicesModel: r)));
  }
}
