
import '../../../domain/entities/user_profile_data_entity.dart';

sealed class GetUserProfileDataStates {}

final class GetUserProfileDataInitial extends GetUserProfileDataStates {}

final class GetUserProfileDataLoading extends GetUserProfileDataStates {}

final class GetUserProfileDataSuccess extends GetUserProfileDataStates {

    final UserProfileDataEntity data;

  GetUserProfileDataSuccess(this.data);
}

final class GetUserProfileDataFailure extends GetUserProfileDataStates {
  final String error;
  GetUserProfileDataFailure(this.error);
}
