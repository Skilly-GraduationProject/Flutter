import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_services_model/get_my_services_model.dart';

class ProviderDataState {
  final CubitState? getMyServicesState;

  final GetMyServicesModel? getMyServicesModel;
  ProviderDataState({this.getMyServicesState, this.getMyServicesModel});
  ProviderDataState editState(
      {CubitState? getMyServicesState = CubitState.initial,
      GetMyServicesModel? getMyServicesModel}) {
    return ProviderDataState(
      getMyServicesState: getMyServicesState ?? this.getMyServicesState,
      getMyServicesModel: getMyServicesModel ?? this.getMyServicesModel,
    );
  }
}
