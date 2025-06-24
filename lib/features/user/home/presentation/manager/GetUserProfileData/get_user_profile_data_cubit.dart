import 'package:bloc/bloc.dart';
import '../../../domain/usecases/get_user_profile_data_usecase.dart';
import 'get_user_profile_data_states.dart';

class GetUserProfileDataCubit extends Cubit<GetUserProfileDataStates> {
  GetUserProfileDataCubit(this.getUserProfileDataUseCase)
      : super(GetUserProfileDataInitial());
  final GetUserProfileDataUseCase getUserProfileDataUseCase;

  Future<void> getUserProfileData() async {
    emit(GetUserProfileDataLoading());
    var result = await getUserProfileDataUseCase.call();
    result.fold((failure) {
      emit(GetUserProfileDataFailure(failure.errMessage));
    }, (data) {
      emit(GetUserProfileDataSuccess(data));
    });
  }
}
