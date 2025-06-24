import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../repos/user_repo.dart';

class RequestEmergencyUseCase {
  final UserRepo userRepo;

  RequestEmergencyUseCase({required this.userRepo});

  Future<Either<Failure, String>> call(
      {required String token,
      required String categoryId,
      required String desc}) async {
    return await userRepo.requestEmergency(
      token: token,
      categoryId: categoryId,
      desc: desc,
    );
  }
}
