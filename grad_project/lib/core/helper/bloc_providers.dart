
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/data/repos/auth_repo_implement.dart';
import '../../features/auth/domain/usecases/forgetpass_usecase.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/presentation/manager/ForgetPassCubit/forgetPass_cubit.dart';
import '../../features/auth/presentation/manager/LoginCubit/login_cubit.dart';
import '../../features/auth/presentation/manager/RegisterCubit/register_cubit.dart';
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
  BlocProvider<ForgetPassCubit>(
    create: (context) => ForgetPassCubit(
        ForgetPassUseCase(authRepo: getIt.get<AuthRepoImplement>())),
  ),
 
];