sealed class RequestEmergencyStates {}

final class RequestEmergencyInitial extends RequestEmergencyStates {}

final class RequestEmergencyLoading extends RequestEmergencyStates {}

final class RequestEmergencySuccess extends RequestEmergencyStates {
  final String requestId;
  RequestEmergencySuccess(this.requestId);
}

final class RequestEmergencyFailure extends RequestEmergencyStates {
  final String error;
  RequestEmergencyFailure(this.error);
}
