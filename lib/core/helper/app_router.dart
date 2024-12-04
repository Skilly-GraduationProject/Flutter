import 'package:go_router/go_router.dart';

import '../../features/shared/auth/presentation/views/forgot_pass_view.dart';
import '../../features/shared/auth/presentation/views/provider_data_view.dart';
import '../../features/shared/auth/presentation/views/reset_pass_view.dart';
import '../../features/shared/auth/presentation/views/sign_in_view.dart';
import '../../features/shared/auth/presentation/views/sign_up_view.dart';
import '../../features/shared/auth/presentation/views/user_data_view.dart';
import '../../features/shared/auth/presentation/views/user_type_view.dart';
import '../../features/shared/auth/presentation/views/verfication_view.dart';
import '../../features/shared/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(path: '/signIn', builder: (context, state) => const SignInView()),
    GoRoute(path: '/signUp', builder: (context, state) => const SignUpView()),
    GoRoute(path: '/forgotPass', builder: (context, state) =>const ForgotPassView()),
    GoRoute(path: '/verify', builder: (context, state) => const VerficationView()),
      GoRoute(path:'/reset', builder: (context, state) => const ResetPassView()),
       GoRoute(path:'/userType', builder: (context, state) => const UserTypeView()),
   GoRoute(path:'/user', builder: (context, state) => const UserDataView()),
   GoRoute(path:'/provider', builder: (context, state) => const ProviderDataView()),
  
  ]);
}
