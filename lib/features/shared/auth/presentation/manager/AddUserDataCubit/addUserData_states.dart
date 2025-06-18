sealed class AddUserDataState {}

final class AddUserDataInitial extends AddUserDataState {}

final class AddUserDataLoading extends AddUserDataState {}

final class AddUserDataSuccess extends AddUserDataState {}

final class AddUserDataFailure extends AddUserDataState {
  final String error;
  AddUserDataFailure(this.error);
}
