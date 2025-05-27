import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_services_model/service.dart';

class ProviderServiceState {
  final CubitState? getServiceState;
  final ProviderService? service;
  final CubitState? deleteServiceState;
  final CubitState? updateServiceState;

  ProviderServiceState({
    this.getServiceState,
    this.service,
    this.deleteServiceState,
    this.updateServiceState,
  });

  ProviderServiceState editState({
    CubitState? getServiceState,
    ProviderService? service,
    CubitState? deleteServiceState,
    CubitState? updateServiceState,
  }) {
    return ProviderServiceState(
      getServiceState: getServiceState ?? this.getServiceState,
      service: service ?? this.service,
      deleteServiceState: deleteServiceState ?? this.deleteServiceState,
      updateServiceState: updateServiceState ?? this.updateServiceState,
    );
  }
}
