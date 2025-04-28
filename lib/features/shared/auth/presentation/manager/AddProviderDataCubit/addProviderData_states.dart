sealed class AddProviderDataState {}

final class AddProviderDataInitial extends AddProviderDataState {}

final class AddProviderDataLoading extends AddProviderDataState {}

final class AddProviderDataSuccess extends AddProviderDataState {}

final class AddProviderDataFailure extends AddProviderDataState {
  final String error;
  AddProviderDataFailure(this.error);
}
