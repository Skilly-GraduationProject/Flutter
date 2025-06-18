import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:grad_project/core/helper/shared_prefrences.dart';
import 'package:grad_project/core/secure_storage_helper.dart';
import 'package:grad_project/features/provider/home/data/repo/home_repo.dart';
import 'package:grad_project/features/provider/profile/data/repos/provider_data_repo.dart';
import 'package:grad_project/features/provider/provider_service.dart/data/repos/provider_service.dart';
import 'package:grad_project/features/provider/requested_service/data/repo/service_repo.dart';
import 'package:grad_project/features/shared/chat/data/repo/chats_repo.dart';
import 'package:grad_project/features/shared/notifications/data/repo/notifications_repo.dart';
import 'package:grad_project/features/user/home/data/repos/user_repo_implement.dart';
import '../../features/shared/auth/domain/usecases/updatePass_usecase.dart';
import '../../features/shared/auth/domain/usecases/verify_code_usecase.dart';
import '../../features/shared/auth/presentation/manager/ResetPassCubit/updatePass_cubit.dart';
import '../../features/shared/auth/presentation/manager/VerifyCodeCubit/verifycode_cubit.dart';
import '../../features/shared/auth/data/repos/auth_repo_implement.dart';
import '../../features/shared/auth/domain/usecases/forgetPass_usecase.dart';
import '../../features/shared/auth/domain/usecases/login_usecase.dart';
import '../../features/shared/auth/domain/usecases/register_usecase.dart';
import '../../features/shared/auth/domain/usecases/verify_email_usecase.dart';
import '../../features/shared/auth/presentation/manager/ForgetpassCubit/forgetPass_cubit.dart';
import '../../features/shared/auth/presentation/manager/LoginCubit/login_cubit.dart';
import '../../features/shared/auth/presentation/manager/RegisterCubit/register_cubit.dart';
import '../../features/shared/auth/presentation/manager/VerifyEmailCubit/verifyemail_cubit.dart';
import '../../features/user/home/data/repos/user_repo_implement.dart';
import '../../features/user/home/domain/usecases/accept_e_offer_usecase.dart';
import '../../features/user/home/domain/usecases/accept_offer_usecase.dart';
import '../../features/user/home/domain/usecases/add_offer_usecase.dart';
import '../../features/user/home/domain/usecases/apply_discount_usecase.dart';
import '../../features/user/home/domain/usecases/buy_service_usecase.dart';
import '../../features/user/home/domain/usecases/get_all_categories_usecase.dart';
import '../../features/user/home/domain/usecases/get_all_services_usecase.dart';
import '../../features/user/home/domain/usecases/get_banners_usecase.dart';
import '../../features/user/home/domain/usecases/get_category_service_providers_usecase.dart';
import '../../features/user/home/domain/usecases/get_category_services.dart';
import '../../features/user/home/domain/usecases/get_emergency_providers_usecase.dart';
import '../../features/user/home/domain/usecases/get_service_offers_usecase.dart';
import '../../features/user/home/domain/usecases/get_service_reviews_usecase.dart';
import '../../features/user/home/domain/usecases/get_user_orders_usecase.dart';
import '../../features/user/home/domain/usecases/get_user_profile_data_usecase.dart';
import '../../features/user/home/domain/usecases/reject_e_offer_usecase.dart';
import '../../features/user/home/domain/usecases/reject_offer_usecase.dart';
import '../../features/user/home/domain/usecases/request_emergency_usecase.dart';
import '../../features/user/home/domain/usecases/request_service_usecase.dart';
import '../../features/user/home/domain/usecases/start_payment_usecase.dart';
import '../../features/user/home/presentation/manager/AcceptEOffer/accept_e_offer_cubit.dart';
import '../../features/user/home/presentation/manager/AcceptOffer/accept_offer_cubit.dart';
import '../../features/user/home/presentation/manager/AddOffer/add_offer_cubit.dart';
import '../../features/user/home/presentation/manager/ApplyDiscount/apply_discount_cubit.dart';
import '../../features/user/home/presentation/manager/BuyService/buy_service_cubit.dart';
import '../../features/user/home/presentation/manager/GetAllCategories/get_all_categories_cubit.dart';
import '../../features/user/home/presentation/manager/GetAllServices/get_all_services_cubit.dart';
import '../../features/user/home/presentation/manager/GetBanners/get_banners_cubit.dart';
import '../../features/user/home/presentation/manager/GetCategoryServiceProviders/get_category_service_providers_cubit.dart';
import '../../features/user/home/presentation/manager/GetCategoryServices/get_category_services_cubit.dart';
import '../../features/user/home/presentation/manager/GetEmergencyProviders/get_emergency_providers_cubit.dart';
import '../../features/user/home/presentation/manager/GetOffers/get_offers_cubit.dart';
import '../../features/user/home/presentation/manager/GetReviews/get_service_reviews_cubit.dart';
import '../../features/user/home/presentation/manager/GetUserOrders/get_user_orders_cubit.dart';
import '../../features/user/home/presentation/manager/GetUserProfileData/get_user_profile_data_cubit.dart';
import '../../features/user/home/presentation/manager/RejectEOffer/rejcet_e_offer_cubit.dart';
import '../../features/user/home/presentation/manager/RejectOffer/reject_offer_cubit.dart';
import '../../features/user/home/presentation/manager/RequestEmergency/request_emergency_cubit.dart';
import '../../features/user/home/presentation/manager/RequestService/request_service_cubit.dart';
import '../../features/user/home/presentation/manager/StartPayment/start_payment_cubit.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

Future<void> setUp() async{
  //-------------------Secure Storage----------------
  getIt.registerLazySingleton<FlutterSecureStorage>(
          () => const FlutterSecureStorage());
  getIt.registerLazySingleton<SecureStorageHelper>(
          () => SecureStorageHelper(secureStorage: getIt<FlutterSecureStorage>()));
          Dio dio = Dio(
    BaseOptions(headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${await loadToken()}',
    }),
  );
  getIt.registerSingleton<ApiService>(ApiService(dio: dio));
  getIt.registerSingleton<AuthRepoImplement>(
      AuthRepoImplement(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<LoginUseCase>(
      LoginUseCase(authRepo: getIt.get<AuthRepoImplement>()));
  getIt
      .registerFactory<LoginCubit>(() => LoginCubit(getIt.get<LoginUseCase>()));

  getIt.registerSingleton<RegisterUseCase>(
      RegisterUseCase(authRepo: getIt.get<AuthRepoImplement>()));
  getIt.registerFactory<RegisterCubit>(
          () => RegisterCubit(getIt.get<RegisterUseCase>()));

  getIt.registerSingleton<ForgetPassUseCase>(
      ForgetPassUseCase(authRepo: getIt.get<AuthRepoImplement>()));
  getIt.registerFactory<ForgetPassCubit>(
          () => ForgetPassCubit(getIt.get<ForgetPassUseCase>()));

  getIt.registerSingleton<VerifyEmailUseCase>(
      VerifyEmailUseCase(authRepo: getIt.get<AuthRepoImplement>()));
  getIt.registerFactory<VerifyEmailCubit>(
          () => VerifyEmailCubit(getIt.get<VerifyEmailUseCase>()));

  getIt.registerSingleton<VerifyCodeUseCase>(
      VerifyCodeUseCase(authRepo: getIt.get<AuthRepoImplement>()));
  getIt.registerFactory<VerifycodeCubit>(
          () => VerifycodeCubit(getIt.get<VerifyCodeUseCase>()));
  getIt.registerSingleton<UpdatePassUseCase>(
      UpdatePassUseCase(authRepo: getIt.get<AuthRepoImplement>()));
  getIt.registerFactory<UpdatePassCubit>(
          () => UpdatePassCubit(getIt.get<UpdatePassUseCase>()));
  getIt.registerSingleton<ProviderHomeRepo>(
      ProviderHomeRepo(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<ProviderDataRepo>(
      ProviderDataRepo(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<ServiceRepo>(
      ServiceRepo(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<NotificationsRepo>(
      NotificationsRepo(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<ProviderServiceRepo>(
      ProviderServiceRepo(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<ChatsRepo>(
      ChatsRepo(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<UserRepoImplement>(
      UserRepoImplement(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<GetAllCategoriesUseCase>(
      GetAllCategoriesUseCase(userRepo: getIt.get<UserRepoImplement>()));
  getIt.registerFactory<GetAllCategoriesCubit>(
      () => GetAllCategoriesCubit(getIt.get<GetAllCategoriesUseCase>()));

  getIt.registerSingleton<GetCategoryServiceProvidersUseCase>(
      GetCategoryServiceProvidersUseCase(
          userRepo: getIt.get<UserRepoImplement>()));
  getIt.registerFactory<GetCategoryServiceProvidersCubit>(() =>
      GetCategoryServiceProvidersCubit(
          getIt.get<GetCategoryServiceProvidersUseCase>()));

  getIt.registerSingleton<GetCategoryServicesUseCase>(
      GetCategoryServicesUseCase(userRepo: getIt.get<UserRepoImplement>()));
  getIt.registerFactory<GetCategoryServicesCubit>(
      () => GetCategoryServicesCubit(getIt.get<GetCategoryServicesUseCase>()));

  getIt.registerSingleton<GetAllServicesUseCase>(
      GetAllServicesUseCase(userRepo: getIt.get<UserRepoImplement>()));
  getIt.registerFactory<GetAllServicesCubit>(
      () => GetAllServicesCubit(getIt.get<GetAllServicesUseCase>()));

  getIt.registerSingleton<GetUserProfileDataUseCase>(
      GetUserProfileDataUseCase(userRepo: getIt.get<UserRepoImplement>()));
  getIt.registerFactory<GetUserProfileDataCubit>(
      () => GetUserProfileDataCubit(getIt.get<GetUserProfileDataUseCase>()));

  getIt.registerSingleton<GetUserOrdersUseCase>(
      GetUserOrdersUseCase(userRepo: getIt.get<UserRepoImplement>()));
  getIt.registerFactory<GetUserOrdersCubit>(
      () => GetUserOrdersCubit(getIt.get<GetUserOrdersUseCase>()));

  getIt.registerSingleton<GetBannersUseCase>(
      GetBannersUseCase(userRepo: getIt.get<UserRepoImplement>()));
  getIt.registerFactory<GetBannersCubit>(
      () => GetBannersCubit(getIt.get<GetBannersUseCase>()));

  getIt.registerSingleton<AddOfferUseCase>(
      AddOfferUseCase(userRepo: getIt.get<UserRepoImplement>()));
  getIt.registerFactory<AddOfferCubit>(
      () => AddOfferCubit(getIt.get<AddOfferUseCase>()));

  getIt.registerSingleton<RequestServiceUseCase>(
      RequestServiceUseCase(userRepo: getIt.get<UserRepoImplement>()));
  getIt.registerFactory<RequestServiceCubit>(
      () => RequestServiceCubit(getIt.get<RequestServiceUseCase>()));

  getIt.registerSingleton<BuyServiceUseCase>(
      BuyServiceUseCase(userRepo: getIt.get<UserRepoImplement>()));
  getIt.registerFactory<BuyServiceCubit>(
      () => BuyServiceCubit(getIt.get<BuyServiceUseCase>()));

  getIt.registerSingleton<GetServiceOffersUseCase>(
      GetServiceOffersUseCase(userRepo: getIt.get<UserRepoImplement>()));
  getIt.registerFactory<GetServiceOffersCubit>(
      () => GetServiceOffersCubit(getIt.get<GetServiceOffersUseCase>()));

  getIt.registerSingleton<GetServiceReviewsUseCase>(
      GetServiceReviewsUseCase(userRepo: getIt.get<UserRepoImplement>()));
  getIt.registerFactory<GetServiceReviewsCubit>(
      () => GetServiceReviewsCubit(getIt.get<GetServiceReviewsUseCase>()));

  getIt.registerSingleton<GetEmergencyProvidersUseCase>(
      GetEmergencyProvidersUseCase(userRepo: getIt.get<UserRepoImplement>()));
  getIt.registerFactory<GetEmergencyProvidersCubit>(
      () => GetEmergencyProvidersCubit(getIt.get<GetEmergencyProvidersUseCase>()));

  getIt.registerSingleton<RequestEmergencyUseCase>(
      RequestEmergencyUseCase(userRepo: getIt.get<UserRepoImplement>()));
  getIt.registerFactory<RequestEmergencyCubit>(
      () => RequestEmergencyCubit(getIt.get<RequestEmergencyUseCase>()));

 getIt.registerSingleton<StartPaymentUseCase>(
      StartPaymentUseCase(userRepo: getIt.get<UserRepoImplement>()));
  getIt.registerFactory<StartPaymentCubit>(
      () => StartPaymentCubit(getIt.get<StartPaymentUseCase>()));

  getIt.registerSingleton<ApplyDiscountUseCase>(
      ApplyDiscountUseCase(userRepo: getIt.get<UserRepoImplement>()));
  getIt.registerFactory<ApplyDiscountCubit>(
      () => ApplyDiscountCubit(getIt.get<ApplyDiscountUseCase>()));

  getIt.registerSingleton<AcceptOfferUseCase>(
      AcceptOfferUseCase(userRepo: getIt.get<UserRepoImplement>()));
  getIt.registerFactory<AcceptOfferCubit>(
      () => AcceptOfferCubit(getIt.get<AcceptOfferUseCase>()));

  getIt.registerSingleton<RejectOfferUseCase>(
      RejectOfferUseCase(userRepo: getIt.get<UserRepoImplement>()));
  getIt.registerFactory<RejectOfferCubit>(
      () => RejectOfferCubit(getIt.get<RejectOfferUseCase>()));

  getIt.registerSingleton<AcceptEOfferUseCase>(
      AcceptEOfferUseCase(userRepo: getIt.get<UserRepoImplement>()));
  getIt.registerFactory<AcceptEOfferCubit>(
      () => AcceptEOfferCubit(getIt.get<AcceptEOfferUseCase>()));

  getIt.registerSingleton<RejectEOfferUseCase>(
      RejectEOfferUseCase(userRepo: getIt.get<UserRepoImplement>()));
  getIt.registerFactory<RejectEOfferCubit>(
      () => RejectEOfferCubit(getIt.get<RejectEOfferUseCase>()));
}
