import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/helper/shared_prefrences.dart';
import '../entities/user_profile_data_entity.dart';
import '../repos/user_repo.dart';

class GetUserProfileDataUseCase extends UseCase<UserProfileDataEntity, String> {
  final UserRepo userRepo;

  GetUserProfileDataUseCase({required this.userRepo});

  @override
  Future<Either<Failure, UserProfileDataEntity>> call() async {
    final token = await loadToken();
    return userRepo.getUserProfileData(token: token!);
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call();
}
