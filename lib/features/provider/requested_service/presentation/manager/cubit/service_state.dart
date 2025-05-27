import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/features/provider/requested_service/data/models/add_service_model/add_service_model.dart';

class ServiceCubitState {
  final CubitState addServiceState;
  final AddServiceModel? addServiceModel;
  final CubitState sendOfferState;
  final String? sendOfferError;

  const ServiceCubitState({
    this.addServiceState = CubitState.initial,
    this.addServiceModel,
    this.sendOfferState = CubitState.initial,
    this.sendOfferError,
  });

  ServiceCubitState copyWith({
    CubitState? addServiceState,
    AddServiceModel? addServiceModel,
    CubitState? sendOfferState,
    String? sendOfferError,
  }) {
    return ServiceCubitState(
      addServiceState: addServiceState ?? this.addServiceState,
      addServiceModel: addServiceModel ?? this.addServiceModel,
      sendOfferState: sendOfferState ?? this.sendOfferState,
      sendOfferError: sendOfferError ?? this.sendOfferError,
    );
  }
}
