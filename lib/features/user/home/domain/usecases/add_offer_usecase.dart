import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../repos/user_repo.dart';

class AddOfferUseCase {
  final UserRepo userRepo;

  AddOfferUseCase({required this.userRepo});

  Future<Either<Failure, void>> call(
      {required String duration,
      required String serviceId,
      required String notes,
      required double price}) async {
    return await userRepo.addOffer(
        serviceId: serviceId, price: price, duration: duration, notes: notes);
  }
}
