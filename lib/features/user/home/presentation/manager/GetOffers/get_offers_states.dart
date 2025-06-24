import '../../../domain/entities/all_service_offers._entity.dart';

sealed class GetServiceOffersStates {}

final class GetServiceOffersInitial extends GetServiceOffersStates {}

final class GetServiceOffersLoading extends GetServiceOffersStates {}

final class GetServiceOffersEmpty extends GetServiceOffersStates {}

final class GetServiceOffersSuccess extends GetServiceOffersStates {
  final List<AllServiceOffersEntity> offers;

  GetServiceOffersSuccess(this.offers);
}

final class GetServiceOffersFailure extends GetServiceOffersStates {
  final String error;
  GetServiceOffersFailure(this.error);
}
