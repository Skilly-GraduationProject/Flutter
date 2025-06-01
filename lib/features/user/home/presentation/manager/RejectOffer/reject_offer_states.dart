

sealed class RejectOfferStates {}

final class RejectOfferInitial extends RejectOfferStates {}

final class RejectOfferLoading extends RejectOfferStates {}

final class RejectOfferSuccess extends RejectOfferStates {

  RejectOfferSuccess();
}

final class RejectOfferFailure extends RejectOfferStates {
  final String error;
  RejectOfferFailure(this.error);
}
