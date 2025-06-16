import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../repos/user_repo.dart';

class RejectOfferUseCase {
  final UserRepo userRepo;

  RejectOfferUseCase({required this.userRepo});

  Future<Either<Failure, void>> call({
    required String token,
    required String offerId,
  }) async {
    return await userRepo.rejectOffer(
      token: token, offerId: offerId,);
  }
}
