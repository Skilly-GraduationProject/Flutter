import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/features/provider/add_service/presentation/add_service_view.dart';
import 'package:grad_project/features/provider/home/presentation/view/service_provider_home_view.dart';
import 'package:grad_project/features/shared/notifications/presentation/view/notification_view.dart';
import 'package:grad_project/features/provider/profile/presentation/view/my_reviews_view.dart';
import 'package:grad_project/features/provider/profile/presentation/view/my_services_view.dart';
import 'package:grad_project/features/provider/profile/presentation/view/my_work_view.dart';
import 'package:grad_project/features/provider/profile/presentation/view/service_provider_profile.dart';
import 'package:grad_project/features/user/home/presentation/views/user_home_view.dart';

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
import '../../features/user/home/domain/entities/all_services_entity.dart';
import '../../features/user/home/domain/entities/user_profile_data_entity.dart';
import '../../features/user/home/presentation/views/all_categories_view.dart';
import '../../features/user/home/presentation/views/category_view.dart';
import '../../features/user/home/presentation/views/discount_services_view.dart';
import '../../features/user/home/presentation/views/discounts_view.dart';
import '../../features/user/home/presentation/views/emergency_view.dart';
import '../../features/user/home/presentation/views/offered_services_view.dart';
import '../../features/user/home/presentation/views/offers_view.dart';
import '../../features/user/home/presentation/views/payment_success_view.dart';
import '../../features/user/home/presentation/views/payment_view.dart';
import '../../features/user/home/presentation/views/points_entry_view.dart';
import '../../features/user/home/presentation/views/request_service_view.dart';
import '../../features/user/home/presentation/views/reviews_view.dart';
import '../../features/user/home/presentation/views/user_orders_view.dart';
import '../../features/user/home/presentation/views/user_profile_view.dart';
import '../../features/user/home/presentation/views/view_service_view.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(path: '/signIn', builder: (context, state) => const SignInView()),
    GoRoute(
        path: '/signUp',
        builder: (context, state) {
          final userType = state.extra as int;
          return SignUpView(
            userType: userType,
          );
        }),
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
        path: '/viewService',
        builder: (context, state) {
          final service = state.extra as AllServicesEntity?;
          if (service == null) {
            return const Scaffold(
              body: Center(child: Text("Service not found")),
            );
          }
          return ViewServiceView(service: service);
        }),
    GoRoute(
      path: '/category',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return CategoryView(
          categoryId: data['id'],
          categoryName: data['name'],
        );
      },
    ),
    GoRoute(
      path: '/userProfile',
      builder: (context, state) {
        final data = state.extra as UserProfileDataEntity?;
        if (data == null) {
          return const Scaffold(
            body: Center(child: Text("Data not found")),
          );
        }
        return UserProfileView(data: data);
      },
    ),
    GoRoute(
        path: RouterPath.userHome,
        builder: (context, state) => const UserHomeView()),
    GoRoute(
        path: RouterPath.ordersView,
        builder: (context, state) => const UserOrdersView()),
    GoRoute(
        path: RouterPath.allCategoriesView,
        builder: (context, state) => const AllCategoriesView()),
         GoRoute(
        path: RouterPath.paymentSuccessView,
        builder: (context, state) => const PaymentSuccessView()),
    GoRoute(
        path: RouterPath.reviewsView,
        builder: (context, state) {
          final serviceId = state.extra as String?;
          if (serviceId == null) {
            return const Text('Missing service ID');
          }
          return ReviewsView(serviceId: serviceId);
        }),
         GoRoute(
        path: RouterPath.paymentView,
        builder: (context, state) {
         final paymentUrl = state.extra as String?;
          if (paymentUrl == null) {
            return const Text('Missing paymentUrl');
          }
          return PaymentView(paymentUrl: paymentUrl,);},),
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
    GoRoute(
        path: RouterPath.emergencyView,
        builder: (context, state) => const EmergencyView()),
    GoRoute(
        path: RouterPath.pointsView,
        builder: (context, state) => const PointsEntryView()),
    GoRoute(
        path: RouterPath.discountsView,
        builder: (context, state) => const DiscountsView()),
    GoRoute(
        path: RouterPath.discountServicesView,
        builder: (context, state) => const DiscountServicesView()),
    GoRoute(
        path: RouterPath.offeredServicesView,
        builder: (context, state) => const OfferedServicesView()),
    GoRoute(
      path: RouterPath.offersView,
      builder: (context, state) {
        final orderId = state.extra as String?;
        if (orderId == null) {
          return const Text('Missing order ID');
        }
        return OffersView(orderId: orderId);
      },
    ),
  ]);
}
