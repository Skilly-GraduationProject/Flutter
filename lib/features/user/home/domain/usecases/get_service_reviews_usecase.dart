import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/helper/shared_prefrences.dart';
import '../entities/service_reviews_entity.dart';
import '../repos/user_repo.dart';

class GetServiceReviewsUseCase
    extends UseCase<List<ServiceReviewsEntity>, String> {
  final UserRepo userRepo;

  GetServiceReviewsUseCase({required this.userRepo});

  @override
  Future<Either<Failure, List<ServiceReviewsEntity>>> call(
      {required String serviceId}) async {
    final token = await loadToken();
    return await userRepo.getServiceReviews(
        serviceId: serviceId, token: token!);
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call({required String serviceId});
}
