sealed class RequestServiceStates {}

final class RequestServiceInitial extends RequestServiceStates {}

final class RequestServiceLoading extends RequestServiceStates {}

final class RequestServiceSuccess extends RequestServiceStates {
  RequestServiceSuccess();
}

final class RequestServiceFailure extends RequestServiceStates {
  final String error;
  RequestServiceFailure(this.error);
}
