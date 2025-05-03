import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/user_profile_data_entity.dart';
import '../repos/user_repo.dart';

class GetUserProfileDataUseCase extends UseCase<UserProfileDataEntity, String> {
  final UserRepo userRepo;

  GetUserProfileDataUseCase({required this.userRepo});

  @override
  Future<Either<Failure, UserProfileDataEntity>> call() async{
    
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   final String? token = prefs.getString('token');

    return userRepo.getUserProfileData(token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImFiOTVlZDI2LTAzODAtNGMzMC05Y2M4LTU0MjRlN2U3YmY5NCIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL21vYmlsZXBob25lIjoiMDEyMjE2NDMxOTUiLCJqdGkiOiI3M2IzMDk0YS0xZDQyLTQwZmEtYThmNC1mMGQ2MGE4NGU4NTciLCJleHAiOjE3NDg1MzExOTQsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI3MSIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NDIwMCJ9.HFe0kcwr0MUpBNBjWWRC2U3I-7E5Iob5z_dvrcGgTGg');
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call();
}
