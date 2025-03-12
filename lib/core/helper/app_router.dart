import 'package:go_router/go_router.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/features/provider/add_service/presentation/add_service_view.dart';
import 'package:grad_project/features/provider/home/presentation/view/service_provider_home_view.dart';
import 'package:grad_project/features/shared/notifications/presentation/view/notification_view.dart';
import 'package:grad_project/features/provider/profile/presentation/view/my_reviews_view.dart';
import 'package:grad_project/features/provider/profile/presentation/view/my_services_view.dart';
import 'package:grad_project/features/provider/profile/presentation/view/my_work_view.dart';
import 'package:grad_project/features/provider/profile/presentation/view/service_provider_profile.dart';
import 'package:grad_project/features/user/home/presentation/view/user_home_view.dart';

import '../../features/shared/auth/presentation/views/forgot_pass_view.dart';
import '../../features/shared/auth/presentation/views/provider_data_view.dart';
import '../../features/shared/auth/presentation/views/update_pass_view.dart';
import '../../features/shared/auth/presentation/views/sign_in_view.dart';
import '../../features/shared/auth/presentation/views/sign_up_view.dart';
import '../../features/shared/auth/presentation/views/user_data_view.dart';
import '../../features/shared/auth/presentation/views/user_type_view.dart';
import '../../features/shared/auth/presentation/views/verfication_code_view.dart';
import '../../features/shared/auth/presentation/views/verfication_email_view.dart';
import '../../features/shared/splash/presentation/views/splash_view.dart';
import '../../features/user/home/presentation/view/category_view.dart';
import '../../features/user/home/presentation/view/request_service_view.dart';
import '../../features/user/home/presentation/view/user_profile_view.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(path: '/signIn', builder: (context, state) => const SignInView()),
    GoRoute(path: '/signUp', builder: (context, state) => const SignUpView()),
    GoRoute(
        path: '/forgotPass',
        builder: (context, state) => const ForgotPassView()),
    GoRoute(
        path: '/verifyEmail',
        builder: (context, state) => const VerficationEmailView()),
    GoRoute(
        path: '/verifyCode',
        builder: (context, state) => const VerficationCodeView()),
    GoRoute(path: '/reset', builder: (context, state) => const ResetPassView()),
    GoRoute(
        path: '/userType', builder: (context, state) => const UserTypeView()),
    GoRoute(path: '/user', builder: (context, state) => const UserDataView()),
    GoRoute(
        path: '/provider',
        builder: (context, state) => const ProviderDataView()),
    GoRoute(
        path: '/requestService',
        builder: (context, state) => const RequestServiceView()),
     GoRoute(
        path: '/category',
        builder: (context, state) => const CategoryView()),
    GoRoute(
        path: '/userProfile',
        builder: (context, state) => const UserProfileView()),
    GoRoute(
        path: RouterPath.userHome,
        builder: (context, state) => const UserHomeView()),
    GoRoute(
        path: RouterPath.providerHome,
        builder: (context, state) => const ServiceProviderHomeView()),
    GoRoute(
        path: RouterPath.providerProfile,
        builder: (context, state) => const ServiceProviderProfile()),
    GoRoute(
        path: RouterPath.myReviewsView,
        builder: (context, state) => const MyReviewsView()),
    GoRoute(
        path: RouterPath.myServicesView,
        builder: (context, state) => const MyServicesView()),
    GoRoute(
        path: RouterPath.myWorkView,
        builder: (context, state) => const MyWorkView()),
    GoRoute(
        path: RouterPath.addServiceView,
        builder: (context, state) => const AddServiceView()),
    GoRoute(
        path: RouterPath.notificationView,
        builder: (context, state) => const NotificationView()),
  ]);
}
