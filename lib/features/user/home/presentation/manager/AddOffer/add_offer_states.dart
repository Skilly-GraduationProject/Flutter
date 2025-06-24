sealed class AddOfferStates {}

final class AddOfferInitial extends AddOfferStates {}

final class AddOfferLoading extends AddOfferStates {}

final class AddOfferSuccess extends AddOfferStates {
  AddOfferSuccess();
}

final class AddOfferFailure extends AddOfferStates {
  final String error;
  AddOfferFailure(this.error);
}
