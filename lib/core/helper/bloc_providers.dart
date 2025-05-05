import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/shared/auth/data/repos/auth_repo_implement.dart';
import '../../features/shared/auth/domain/usecases/forgetPass_usecase.dart';
import '../../features/shared/auth/domain/usecases/login_usecase.dart';
import '../../features/shared/auth/domain/usecases/register_usecase.dart';
import '../../features/shared/auth/domain/usecases/updatePass_usecase.dart';
import '../../features/shared/auth/domain/usecases/verify_code_usecase.dart';
import '../../features/shared/auth/domain/usecases/verify_email_usecase.dart';
import '../../features/shared/auth/presentation/manager/ForgetpassCubit/forgetPass_cubit.dart';
import '../../features/shared/auth/presentation/manager/LoginCubit/login_cubit.dart';
import '../../features/shared/auth/presentation/manager/RegisterCubit/register_cubit.dart';
import '../../features/shared/auth/presentation/manager/ResetPassCubit/updatePass_cubit.dart';
import '../../features/shared/auth/presentation/manager/VerifyCodeCubit/verifycode_cubit.dart';
import '../../features/shared/auth/presentation/manager/VerifyEmailCubit/verifyemail_cubit.dart';
import '../../features/user/home/data/repos/user_repo_implement.dart';
import '../../features/user/home/domain/usecases/add_offer_usecase.dart';
import '../../features/user/home/domain/usecases/get_all_categories_usecase.dart';
import '../../features/user/home/domain/usecases/get_all_services_usecase.dart';
import '../../features/user/home/domain/usecases/get_banners_usecase.dart';
import '../../features/user/home/domain/usecases/get_category_service_providers_usecase.dart';
import '../../features/user/home/domain/usecases/get_category_services.dart';
import '../../features/user/home/domain/usecases/get_user_orders_usecase.dart';
import '../../features/user/home/domain/usecases/get_user_profile_data_usecase.dart';
import '../../features/user/home/domain/usecases/request_service_usecase.dart';
import '../../features/user/home/presentation/manager/AddOffer/add_offer_cubit.dart';
import '../../features/user/home/presentation/manager/GetAllCategories/get_all_categories_cubit.dart';
import '../../features/user/home/presentation/manager/GetAllServices/get_all_services_cubit.dart';
import '../../features/user/home/presentation/manager/GetBanners/get_banners_cubit.dart';
import '../../features/user/home/presentation/manager/GetCategoryServiceProviders/get_category_service_providers_cubit.dart';
import '../../features/user/home/presentation/manager/GetCategoryServices/get_category_services_cubit.dart';
import '../../features/user/home/presentation/manager/GetUserOrders/get_user_orders_cubit.dart';
import '../../features/user/home/presentation/manager/GetUserProfileData/get_user_profile_data_cubit.dart';
import '../../features/user/home/presentation/manager/RequestService/request_service_cubit.dart';
import 'service_locator.dart';

final blocProviders = <BlocProvider>[
  BlocProvider<LoginCubit>(
    create: (context) =>
        LoginCubit(LoginUseCase(authRepo: getIt.get<AuthRepoImplement>())),
  ),
  BlocProvider<RegisterCubit>(
    create: (context) => RegisterCubit(
        RegisterUseCase(authRepo: getIt.get<AuthRepoImplement>())),
  ),
  BlocProvider<VerifycodeCubit>(
    create: (context) => VerifycodeCubit(
        VerifyCodeUseCase(authRepo: getIt.get<AuthRepoImplement>())),
  ),
  BlocProvider<VerifyEmailCubit>(
    create: (context) => VerifyEmailCubit(
        VerifyEmailUseCase(authRepo: getIt.get<AuthRepoImplement>())),
  ),
  BlocProvider<ForgetPassCubit>(
    create: (context) => ForgetPassCubit(
        ForgetPassUseCase(authRepo: getIt.get<AuthRepoImplement>())),
  ),
  BlocProvider<UpdatePassCubit>(
    create: (context) => UpdatePassCubit(
        UpdatePassUseCase(authRepo: getIt.get<AuthRepoImplement>())),
  ),
  BlocProvider<GetAllCategoriesCubit>(
    create: (context) => GetAllCategoriesCubit(
        GetAllCategoriesUseCase(userRepo: getIt.get<UserRepoImplement>())),
  ),
  BlocProvider<GetCategoryServiceProvidersCubit>(
    create: (context) => GetCategoryServiceProvidersCubit(
       GetCategoryServiceProvidersUseCase(userRepo: getIt.get<UserRepoImplement>())),
  ),
  BlocProvider<GetCategoryServicesCubit>(
    create: (context) => GetCategoryServicesCubit(
       GetCategoryServicesUseCase(userRepo: getIt.get<UserRepoImplement>())),
  ),
  BlocProvider<GetAllServicesCubit>(
    create: (context) => GetAllServicesCubit(
       GetAllServicesUseCase(userRepo: getIt.get<UserRepoImplement>())),
  ),
  BlocProvider<GetUserProfileDataCubit>(
    create: (context) => GetUserProfileDataCubit(
       GetUserProfileDataUseCase(userRepo: getIt.get<UserRepoImplement>())),
  ),
  BlocProvider<GetUserOrdersCubit>(
    create: (context) => GetUserOrdersCubit(
       GetUserOrdersUseCase(userRepo: getIt.get<UserRepoImplement>())),
  ),
  BlocProvider<GetBannersCubit>(
    create: (context) => GetBannersCubit(
       GetBannersUseCase(userRepo: getIt.get<UserRepoImplement>())),
  ),
   BlocProvider<AddOfferCubit>(
    create: (context) => AddOfferCubit(
       AddOfferUseCase(userRepo: getIt.get<UserRepoImplement>())),
  ),
   BlocProvider<RequestServiceCubit>(
    create: (context) => RequestServiceCubit(
       RequestServiceUseCase(userRepo: getIt.get<UserRepoImplement>())),
  ),
];
