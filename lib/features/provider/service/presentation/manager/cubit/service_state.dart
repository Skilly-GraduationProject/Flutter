import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/features/provider/service/data/models/add_service_model/add_service_model.dart';

class ServiceCubitState {
  final CubitState addServiceState;
  final AddServiceModel? addServiceModel;

  const ServiceCubitState({
    this.addServiceState = CubitState.initial,
    this.addServiceModel,
  });

  ServiceCubitState copyWith({
    CubitState? addServiceState,
    AddServiceModel? addServiceModel,
  }) {
    return ServiceCubitState(
      addServiceState: addServiceState ?? this.addServiceState,
      addServiceModel: addServiceModel ?? this.addServiceModel,
    );
  }
}
