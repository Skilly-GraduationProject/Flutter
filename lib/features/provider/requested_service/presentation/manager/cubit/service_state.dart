import 'package:grad_project/core/utils/cubit_states.dart';
import 'package:grad_project/features/provider/home/data/models/get_requested_services_model/service.dart';
import 'package:grad_project/features/provider/requested_service/data/models/add_service_model/add_service_model.dart';
import 'package:grad_project/features/provider/requested_service/data/models/offer_model.dart';

class ServiceCubitState {
  final CubitState addServiceState;
  final AddServiceModel? addServiceModel;
  final CubitState sendOfferState;
  final String? sendOfferError;
  final CubitState getRequestedServiceState;
  final RequestedService? getRequestedServiceModel;
  final CubitState getOfferState;
  final String? getOfferError;
  final OfferModel? offerModel;
  final CubitState acceptOfferState;
  final String? acceptOfferError;
  final String? acceptOfferMessage;
  final CubitState rejectOfferState;
  final String? rejectOfferError;
  final String? rejectOfferMessage;
  final CubitState acceptServiceState;
  final String? acceptServiceError;
  final String? acceptServiceMessage;

  const ServiceCubitState({
    this.addServiceState = CubitState.initial,
    this.addServiceModel,
    this.sendOfferState = CubitState.initial,
    this.sendOfferError,
    this.getRequestedServiceState = CubitState.initial,
    this.getRequestedServiceModel,
    this.getOfferState = CubitState.initial,
    this.getOfferError,
    this.offerModel,
    this.acceptOfferState = CubitState.initial,
    this.acceptOfferError,
    this.acceptOfferMessage,
    this.rejectOfferState = CubitState.initial,
    this.rejectOfferError,
    this.rejectOfferMessage,
    this.acceptServiceState = CubitState.initial,
    this.acceptServiceError,
    this.acceptServiceMessage,
  });

  ServiceCubitState copyWith({
    CubitState? addServiceState,
    AddServiceModel? addServiceModel,
    CubitState? sendOfferState,
    String? sendOfferError,
    CubitState? getRequestedServiceState,
    RequestedService? getRequestedServiceModel,
    CubitState? getOfferState,
    String? getOfferError,
    OfferModel? offerModel,
    CubitState? acceptOfferState,
    String? acceptOfferError,
    String? acceptOfferMessage,
    CubitState? rejectOfferState,
    String? rejectOfferError,
    String? rejectOfferMessage,
    CubitState? acceptServiceState,
    String? acceptServiceError,
    String? acceptServiceMessage,
  }) {
    return ServiceCubitState(
      addServiceState: addServiceState ?? this.addServiceState,
      addServiceModel: addServiceModel ?? this.addServiceModel,
      sendOfferState: sendOfferState ?? this.sendOfferState,
      sendOfferError: sendOfferError ?? this.sendOfferError,
      getRequestedServiceState:
          getRequestedServiceState ?? this.getRequestedServiceState,
      getRequestedServiceModel:
          getRequestedServiceModel ?? this.getRequestedServiceModel,
      getOfferState: getOfferState ?? this.getOfferState,
      getOfferError: getOfferError ?? this.getOfferError,
      offerModel: offerModel ?? this.offerModel,
      acceptOfferState: acceptOfferState ?? this.acceptOfferState,
      acceptOfferError: acceptOfferError ?? this.acceptOfferError,
      acceptOfferMessage: acceptOfferMessage ?? this.acceptOfferMessage,
      rejectOfferState: rejectOfferState ?? this.rejectOfferState,
      rejectOfferError: rejectOfferError ?? this.rejectOfferError,
      rejectOfferMessage: rejectOfferMessage ?? this.rejectOfferMessage,
      acceptServiceState: acceptServiceState ?? this.acceptServiceState,
      acceptServiceError: acceptServiceError ?? this.acceptServiceError,
      acceptServiceMessage: acceptServiceMessage ?? this.acceptServiceMessage,
    );
  }
}
