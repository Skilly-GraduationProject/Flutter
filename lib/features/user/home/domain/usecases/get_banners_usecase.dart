import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/get_banners_entitiy.dart';
import '../repos/user_repo.dart';

class GetBannersUseCase extends UseCase<List<GetBannersEntity>, String> {
  final UserRepo userRepo;

  GetBannersUseCase({required this.userRepo});

  @override
  Future<Either<Failure, List<GetBannersEntity>>> call() {
    return userRepo.getBanners();
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call();
}
