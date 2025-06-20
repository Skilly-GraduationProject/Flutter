import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../repos/user_repo.dart';

class AcceptEOfferUseCase {
  final UserRepo userRepo;

  AcceptEOfferUseCase({required this.userRepo});

  Future<Either<Failure, void>> call({
    required String token,
    required String requestId,
    required String providerId,
  }) async {
    return await userRepo.acceptEOffer(
      token: token,
      providerId: providerId,
      requestId: requestId,
    );
  }
}
