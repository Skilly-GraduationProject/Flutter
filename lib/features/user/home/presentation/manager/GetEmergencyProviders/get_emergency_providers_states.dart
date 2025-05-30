
import '../../../domain/entities/emergency_providers_entity.dart';


sealed class GetEmergencyProvidersStates {}

final class GetEmergencyProvidersInitial extends GetEmergencyProvidersStates {}

final class GetEmergencyProvidersLoading extends GetEmergencyProvidersStates {}

final class GetEmergencyProvidersSuccess extends GetEmergencyProvidersStates {

    final List<EmergencyProvidersEntity> offers;

  GetEmergencyProvidersSuccess(this.offers);
}

final class GetEmergencyProvidersFailure extends GetEmergencyProvidersStates {
  final String error;
  GetEmergencyProvidersFailure(this.error);
}
