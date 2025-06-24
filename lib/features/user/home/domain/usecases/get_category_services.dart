import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/helper/shared_prefrences.dart';
import '../entities/all_services_entity.dart';
import '../repos/user_repo.dart';

class GetCategoryServicesUseCase
    extends UseCase<List<AllServicesEntity>, GetCategoryServicesParams> {
  final UserRepo userRepo;

  GetCategoryServicesUseCase({required this.userRepo});

  @override
  Future<Either<Failure, List<AllServicesEntity>>> call(
      GetCategoryServicesParams params) async {
    final token = await loadToken();
    return userRepo.getCategoryServices(
      categoryId: params.categoryId,
      token: token!,
      sort: params.sort,
    );
  }
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class GetCategoryServicesParams {
  final String categoryId;
  final String? sort;

  GetCategoryServicesParams({required this.categoryId, this.sort});
}
