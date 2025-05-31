sealed class StartPaymentStates {}

final class StartPaymentInitial extends StartPaymentStates {}

final class StartPaymentLoading extends StartPaymentStates {}

final class StartPaymentSuccess extends StartPaymentStates {
  final String paymentUrl;
  StartPaymentSuccess(this.paymentUrl);
}

final class StartPaymentFailure extends StartPaymentStates {
  final String error;
  StartPaymentFailure(this.error);
}
