sealed class RejectEOfferStates {}

final class RejectEOfferInitial extends RejectEOfferStates {}

final class RejectEOfferLoading extends RejectEOfferStates {}

final class RejectEOfferSuccess extends RejectEOfferStates {
  RejectEOfferSuccess();
}

final class RejectEOfferFailure extends RejectEOfferStates {
  final String error;
  RejectEOfferFailure(this.error);
}
