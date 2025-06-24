sealed class AcceptEOfferStates {}

final class AcceptEOfferInitial extends AcceptEOfferStates {}

final class AcceptEOfferLoading extends AcceptEOfferStates {}

final class AcceptEOfferSuccess extends AcceptEOfferStates {
  AcceptEOfferSuccess();
}

final class AcceptEOfferFailure extends AcceptEOfferStates {
  final String error;
  AcceptEOfferFailure(this.error);
}
