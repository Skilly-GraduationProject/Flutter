import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../repos/user_repo.dart';

class RejectEOfferUseCase {
  final UserRepo userRepo;

  RejectEOfferUseCase({required this.userRepo});

  Future<Either<Failure, void>> call({
    required String token,
    required String requestId,
    required String providerId,
  }) async {
    return await userRepo.rejectEOffer(
      token: token,
      providerId: providerId,
      requestId: requestId,
    );
  }
}
