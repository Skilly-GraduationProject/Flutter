import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/helper/shared_prefrences.dart';
import '../entities/user_orders_entity.dart';
import '../repos/user_repo.dart';

class GetUserOrdersUseCase extends UseCase<List<UserOrdersEntity>, String> {
  final UserRepo userRepo;

  GetUserOrdersUseCase({required this.userRepo});

  @override
  Future<Either<Failure, List<UserOrdersEntity>>> call() async {
    final token = await loadToken();

    return userRepo.getUserOrders(token: token!);
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call();
}
