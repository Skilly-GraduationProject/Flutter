

import '../../../domain/entities/all_services_entity.dart';

sealed class ApplyDiscountStates {}

final class ApplyDiscountInitial extends ApplyDiscountStates {}

final class ApplyDiscountLoading extends ApplyDiscountStates {}

final class ApplyDiscountSuccess extends ApplyDiscountStates {
  final AllServicesEntity service;
  ApplyDiscountSuccess(this.service);

}

final class ApplyDiscountFailure extends ApplyDiscountStates {
  final String error;
  ApplyDiscountFailure(this.error);
}
