import '../../../../../core/errors/failure.dart';
import '../entities/all_services_entity.dart';
import '../entities/category_entitiy.dart';
import '../entities/get_banners_entitiy.dart';
import '../entities/offered_services_entity.dart';
import '../entities/service_providers_entity.dart';
import 'package:dartz/dartz.dart';

import '../entities/user_orders_entity.dart';
import '../entities/user_profile_data_entity.dart';

abstract class UserRepo {
  Future<Either<Failure, CategoryEntity>> getAllCategories();
  Future<Either<Failure, List<ServiceProvidersEntity>>>
      getCategoryServiceProviders({required String categoryId});
  Future<Either<Failure, List<OfferedServicesEntity>>> getCategoryServices(
      {required String categoryId});
  Future<Either<Failure, List<AllServicesEntity>>> getAllServices();
  Future<Either<Failure, UserProfileDataEntity>> getUserProfileData(
      {required String token});
  Future<Either<Failure, List<UserOrdersEntity>>> getUserOrders(
      {required String token});
  Future<Either<Failure, List<GetBannersEntity>>> getBanners();
  Future<Either<Failure, void>> requestService( {
    required String name,
    required String deliveryTime,
    required String notes,
    required String video,
    required double price,
    required String category,
    required String startDate});
    Future<Either<Failure, void>> addOffer( {
    required String token,
    required String serviceId,
    required double price,
    required String duration,
    required String notes,
});
}
