import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/data/repos/auth_repo_implement.dart';
import '../../features/auth/domain/usecases/forgetpass_usecase.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/presentation/manager/ForgetPassCubit/forgetPass_cubit.dart';
import '../../features/auth/presentation/manager/LoginCubit/login_cubit.dart';
import '../../features/auth/presentation/manager/RegisterCubit/register_cubit.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<ApiService>(ApiService(Dio(BaseOptions())));
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

  // getIt.registerSingleton<VerifyUseCase>(
  //     VerifyUseCase(authRepo: getIt.get<AuthRepoImplement>()));
  // getIt.registerFactory<VerifycodeCubit>(
  //     () => VerifycodeCubit(getIt.get<VerifyUseCase>()));

  // getIt.registerSingleton<UpdatepassUsecase>(
  //     UpdatepassUsecase(authRepo: getIt.get<AuthRepoImplement>()));
  // getIt.registerFactory<UpdatepassCubit>(
  //     () => UpdatepassCubit(getIt.get<UpdatepassUsecase>()));

}