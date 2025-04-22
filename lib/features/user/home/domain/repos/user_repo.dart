
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/category_entitiy.dart';
import '../entities/service_providers_entity.dart';

abstract class UserRepo {

   Future<Either<Failure, CategoryEntity>> getAllCategories();
   Future<Either<Failure, List<ServiceProvidersEntity>>> getCategoryServiceProviders({required String categoryId});
   Future<Either<Failure, CategoryEntity>> getCategoryServices({required String categoryId});
}