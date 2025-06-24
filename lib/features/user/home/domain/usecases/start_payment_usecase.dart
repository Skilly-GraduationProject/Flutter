import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../repos/user_repo.dart';

class StartPaymentUseCase {
  final UserRepo userRepo;

  StartPaymentUseCase({required this.userRepo});

  Future<Either<Failure, String>> call({
    required String token,
    required String serviceId,
  }) async {
    return await userRepo.startPayment(
      token: token,
      serviceId: serviceId,
    );
  }
}
