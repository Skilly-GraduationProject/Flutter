

sealed class BuyServiceStates {}

final class BuyServiceInitial extends BuyServiceStates {}

final class BuyServiceLoading extends BuyServiceStates {}

final class BuyServiceSuccess extends BuyServiceStates {

  BuyServiceSuccess();
}

final class BuyServiceFailure extends BuyServiceStates {
  final String error;
  BuyServiceFailure(this.error);
}
