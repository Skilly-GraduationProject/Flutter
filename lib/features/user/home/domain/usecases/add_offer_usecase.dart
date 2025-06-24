import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../repos/user_repo.dart';

class AddOfferUseCase {
  final UserRepo userRepo;

  AddOfferUseCase({required this.userRepo});

  Future<Either<Failure, void>> call({
    required String token,
    required String serviceId,
    required double price,
    required String duration,
    required String notes,
  }) async {
    return await userRepo.addOffer(
        token: token,
        serviceId: serviceId,
        price: price,
        duration: duration,
        notes: notes);
  }
}
