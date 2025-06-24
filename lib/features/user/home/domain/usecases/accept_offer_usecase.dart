import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../repos/user_repo.dart';

class AcceptOfferUseCase {
  final UserRepo userRepo;

  AcceptOfferUseCase({required this.userRepo});

  Future<Either<Failure, void>> call({
    required String token,
    required String offerId,
  }) async {
    return await userRepo.acceptOffer(token: token, offerId: offerId);
  }
}
