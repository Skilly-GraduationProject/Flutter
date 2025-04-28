import '../../../domain/entities/all_services_entity.dart';



sealed class GetAllServicesStates {}

final class GetAllServicesInitial extends GetAllServicesStates {}

final class GetAllServicesLoading extends GetAllServicesStates {}

final class GetAllServicesSuccess extends GetAllServicesStates {

    final List<AllServicesEntity> services;

  GetAllServicesSuccess(this.services);
}

final class GetAllServicesFailure extends GetAllServicesStates {
  final String error;
  GetAllServicesFailure(this.error);
}
