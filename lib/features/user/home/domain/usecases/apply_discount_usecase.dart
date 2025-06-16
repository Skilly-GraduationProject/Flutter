import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../repos/user_repo.dart';

class ApplyDiscountUseCase {
  final UserRepo userRepo;

  ApplyDiscountUseCase({required this.userRepo});

  Future<Either<Failure, void>> call({
    required String token,
    required String serviceId,
  }) async {
    return await userRepo.applyDiscount(
      token: token,
      serviceId: serviceId,
    );
  }
}
