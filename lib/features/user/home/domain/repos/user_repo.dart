import 'dart:io';

import '../../../../../core/errors/failure.dart';
import '../entities/all_service_offers._entity.dart';
import '../entities/all_services_entity.dart';
import '../entities/category_entitiy.dart';
import '../entities/emergency_providers_entity.dart';
import '../entities/get_banners_entitiy.dart';
import '../entities/service_providers_entity.dart';
import 'package:dartz/dartz.dart';

import '../entities/service_reviews_entity.dart';
import '../entities/user_orders_entity.dart';
import '../entities/user_profile_data_entity.dart';

abstract class UserRepo {
  Future<Either<Failure, CategoryEntity>> getAllCategories();
  Future<Either<Failure, List<ServiceProvidersEntity>>>
      getCategoryServiceProviders({required String categoryId});
  Future<Either<Failure, List<  AllServicesEntity>>> getCategoryServices(
      {required String categoryId,required String token,String? sort});
  Future<Either<Failure, List<AllServicesEntity>>> getAllServices({
    required String token,String?sort
  });
  Future<Either<Failure, UserProfileDataEntity>> getUserProfileData(
      {required String token});
  Future<Either<Failure, List<UserOrdersEntity>>> getUserOrders(
      {required String token});
  Future<Either<Failure, List<GetBannersEntity>>> getBanners();
  Future<Either<Failure, void>> requestService( {
   required String token,
    required String deliveryTime,
     required String name,
    required String notes,
    required String category,
    required File? video,
      required String startDate,
    required List<File>?images,
    required double price
    ,});
    Future<Either<Failure, void>> addOffer( {
    required String token,
    required String serviceId,
    required double price,
    required String duration,
    required String notes,
});
Future<Either<Failure, void>> buyService( {
    required String token,
    required String serviceId,
    required String startDate,
});
Future<Either<Failure, List<AllServiceOffersEntity>>> getServiceOffers({
    required String token,required String serviceId
  });
Future<Either<Failure, List<ServiceReviewsEntity>>> getServiceReviews({
    required String token,required String serviceId
  });
  Future<Either<Failure,String>> requestEmergency( {
    required String token,
    required String categoryId,
    required String desc,
});
Future<Either<Failure, List<EmergencyProvidersEntity>>> getEmergencyProviders({
    required String token,required String requestId
  });
  Future<Either<Failure,String>> startPayment( {
    required String token,
    required String serviceId,

});
Future<Either<Failure, void>> applyDiscount( {
    required String token,
    required String serviceId,
});
Future<Either<Failure, void>> acceptOffer( {
    required String token,
    required String offerId,
});
Future<Either<Failure, void>> rejectOffer( {
    required String token,
    required String offerId,
});
Future<Either<Failure, void>> acceptEOffer( {
    required String token,
    required String requestId,
    required String providerId,
});
Future<Either<Failure, void>> rejectEOffer( {
    required String token,
    required String requestId,
    required String providerId,
});

}


