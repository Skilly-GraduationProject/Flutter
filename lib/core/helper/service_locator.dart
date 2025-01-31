import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:grad_project/core/secure_storage_helper.dart';
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
import 'api_service.dart';

final getIt = GetIt.instance;

void setUp() {
  //-------------------Secure Storage----------------
  getIt.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage());
  getIt.registerLazySingleton<SecureStorageHelper>(
      () => SecureStorageHelper(secureStorage: getIt<FlutterSecureStorage>()));  getIt.registerSingleton<ApiService>(ApiService(Dio(BaseOptions())));
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
}
