import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/helper/shared_prefrences.dart';
import '../entities/all_services_entity.dart';
import '../repos/user_repo.dart';

class GetAllServicesUseCase extends UseCase<List<AllServicesEntity>, String> {
  final UserRepo userRepo;

  GetAllServicesUseCase({required this.userRepo});

  @override
  Future<Either<Failure, List<AllServicesEntity>>> call(String? sort) async {
    final token = await loadToken();
    return userRepo.getAllServices(sort: sort, token: token!);

  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params sort);
}
