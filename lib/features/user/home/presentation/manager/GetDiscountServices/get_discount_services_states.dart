
import '../../../domain/entities/discount_services_entity.dart';



sealed class GetDiscountServicesStates {}

final class GetDiscountServicesInitial extends GetDiscountServicesStates {}

final class GetDiscountServicesLoading extends GetDiscountServicesStates {}

final class GetDiscountServicesSuccess extends GetDiscountServicesStates {

    final List<DiscountServicesEntity> services;

  GetDiscountServicesSuccess(this.services);
}

final class GetDiscountServicesFailure extends GetDiscountServicesStates {
  final String error;
  GetDiscountServicesFailure(this.error);
}
