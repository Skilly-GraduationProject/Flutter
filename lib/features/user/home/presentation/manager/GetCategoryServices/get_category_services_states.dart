import '../../../domain/entities/offered_services_entity.dart';

sealed class GetCategoryServicesStates {}

final class GetCategoryServicesInitial extends GetCategoryServicesStates {}

final class GetCategoryServicesLoading extends GetCategoryServicesStates {}

final class GetCategoryServicesSuccess extends GetCategoryServicesStates {
  final List<OfferedServicesEntity> services;

  GetCategoryServicesSuccess(this.services);
}

final class GetCategoryServicesFailure extends GetCategoryServicesStates {
  final String error;
  GetCategoryServicesFailure(this.error);
}
