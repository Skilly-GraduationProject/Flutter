import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/category_entitiy.dart';
import '../repos/user_repo.dart';

class GetAllCategoriesUseCase extends UseCase<CategoryEntity, String>{
  final UserRepo userRepo;

  GetAllCategoriesUseCase({required this.userRepo});
@override
  Future<Either<Failure, CategoryEntity>> call()async {
    return await userRepo.getAllCategories();
  }
}
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call();
}