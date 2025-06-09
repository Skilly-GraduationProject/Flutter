import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/offered_services_entity.dart';
import '../repos/user_repo.dart';

class GetCategoryServicesUseCase
    extends UseCase<List<OfferedServicesEntity>, String> {
  final UserRepo userRepo;

  GetCategoryServicesUseCase({required this.userRepo});

  @override
  Future<Either<Failure, List<OfferedServicesEntity>>> call(String categoryId) {
    return userRepo.getCategoryServices(categoryId: categoryId);
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params categoryId);
}
