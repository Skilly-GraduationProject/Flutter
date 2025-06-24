sealed class ApplyDiscountStates {}

final class ApplyDiscountInitial extends ApplyDiscountStates {}

final class ApplyDiscountLoading extends ApplyDiscountStates {}

final class ApplyDiscountSuccess extends ApplyDiscountStates {
  ApplyDiscountSuccess();
}

final class ApplyDiscountFailure extends ApplyDiscountStates {
  final String error;
  ApplyDiscountFailure(this.error);
}
