import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/helper/shared_prefrences.dart';
import '../entities/discount_services_entity.dart';
import '../repos/user_repo.dart';

class GetDiscountServicesUseCase
    extends UseCase<List<DiscountServicesEntity>, String> {
  final UserRepo userRepo;

  GetDiscountServicesUseCase({required this.userRepo});

  @override
  Future<Either<Failure, List<DiscountServicesEntity>>> call(
      String? sort) async {
    final token = await loadToken();
    return userRepo.getAllDiscountServices(sort: sort, token: token!);
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params sort);
}
