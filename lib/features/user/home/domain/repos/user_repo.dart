import '../../../../../core/errors/failure.dart';
import '../entities/all_services_entity.dart';
import '../entities/category_entitiy.dart';
import '../entities/offered_services_entity.dart';
import '../entities/service_providers_entity.dart';
import 'package:dartz/dartz.dart';

import '../entities/user_profile_data_entity.dart';

abstract class UserRepo {
   Future<Either<Failure, CategoryEntity>> getAllCategories();
   Future<Either<Failure, List<ServiceProvidersEntity>>> getCategoryServiceProviders({required String categoryId});
   Future<Either<Failure, List<OfferedServicesEntity>>> getCategoryServices({required String categoryId});
   Future<Either<Failure, List<AllServicesEntity>>> getAllServices();
   Future<Either<Failure, UserProfileDataEntity>> getUserProfileData({required String token});
}