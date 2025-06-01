

sealed class AcceptOfferStates {}

final class AcceptOfferInitial extends AcceptOfferStates {}

final class AcceptOfferLoading extends AcceptOfferStates {}

final class AcceptOfferSuccess extends AcceptOfferStates {

  AcceptOfferSuccess();
}

final class AcceptOfferFailure extends AcceptOfferStates {
  final String error;
  AcceptOfferFailure(this.error);
}
