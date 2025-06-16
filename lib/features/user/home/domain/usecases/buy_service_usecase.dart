import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../repos/user_repo.dart';

class BuyServiceUseCase {
  final UserRepo userRepo;

  BuyServiceUseCase({required this.userRepo});

  Future<Either<Failure, void>> call({
    required String token,
    required String serviceId,
    required String startDate,
  }) async {
    return await userRepo.buyService(
        token: token, serviceId: serviceId, startDate: startDate);
  }
}
