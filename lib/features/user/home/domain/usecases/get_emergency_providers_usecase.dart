import 'package:dartz/dartz.dart';
import 'package:grad_project/core/helper/shared_prefrences.dart';
import '../../../../../core/errors/failure.dart';
import '../entities/emergency_providers_entity.dart';
import '../repos/user_repo.dart';

class GetEmergencyProvidersUseCase
    extends UseCase<List<EmergencyProvidersEntity>, String> {
  final UserRepo userRepo;

  GetEmergencyProvidersUseCase({required this.userRepo});

  @override
  Future<Either<Failure, List<EmergencyProvidersEntity>>> call(
      {required String requestId}) async {
    final token = await loadToken();

    return await userRepo.getEmergencyProviders(
      token: token!,
      requestId: requestId,
    );
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call({required String requestId});
}
