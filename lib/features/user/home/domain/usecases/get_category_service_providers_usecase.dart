import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/service_providers_entity.dart';
import '../repos/user_repo.dart';

class GetCategoryServiceProvidersUseCase extends UseCase<List<ServiceProvidersEntity>, String> {
  final UserRepo userRepo;

  GetCategoryServiceProvidersUseCase({required this.userRepo});

  @override
  Future<Either<Failure, List<ServiceProvidersEntity>>> call(String categoryId) {
    return userRepo.getCategoryServiceProviders(categoryId: categoryId);
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params categoryId);
}