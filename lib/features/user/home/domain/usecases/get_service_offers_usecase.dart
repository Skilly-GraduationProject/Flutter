import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/helper/shared_prefrences.dart';
import '../entities/all_service_offers._entity.dart';
import '../repos/user_repo.dart';

class GetServiceOffersUseCase
    extends UseCase<List<AllServiceOffersEntity>, String> {
  final UserRepo userRepo;

  GetServiceOffersUseCase({required this.userRepo});

  @override
  Future<Either<Failure, List<AllServiceOffersEntity>>> call(
      {required String serviceId}) async {
    final token = await loadToken();

    return await userRepo.getServiceOffers(serviceId: serviceId, token: token!);
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call({required String serviceId});
}
