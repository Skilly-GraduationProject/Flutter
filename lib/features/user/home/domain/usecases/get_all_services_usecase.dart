import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/all_services_entity.dart';
import '../repos/user_repo.dart';

class GetAllServicesUseCase extends UseCase<List<AllServicesEntity>, String> {
  final UserRepo userRepo;

  GetAllServicesUseCase({required this.userRepo});

  @override
  Future<Either<Failure, List<AllServicesEntity>>> call() {
    return userRepo.getAllServices(latitude: 0,longitude: 0);
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call();
}