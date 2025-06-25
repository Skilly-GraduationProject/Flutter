import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/features/provider/home/data/models/get_requested_services_model/service.dart';
import 'package:grad_project/features/provider/home/data/models/provider_profile/provider_profile.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_gallery_model/servicesgallery.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_services_model/service.dart';
import 'package:grad_project/features/provider/profile/data/models/get_reviews_model/review.dart';
import 'package:grad_project/features/provider/profile/data/models/get_services_in_progress/request_service.dart';
import 'package:grad_project/features/provider/profile/presentation/view/edit_profile_view.dart';
import 'package:grad_project/features/provider/profile/presentation/view/in_progress_services_view.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/add_gallery_service_view.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/edit_service_view.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/in_progress_service_view.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/provider_gallery_service_view.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/provider_service_view.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/service_offers.dart';
import 'package:grad_project/features/provider/requested_service/presentation/add_service_view.dart';
import 'package:grad_project/features/provider/home/presentation/view/service_provider_home_view.dart';
import 'package:grad_project/features/provider/requested_service/presentation/get_service_view.dart';
import 'package:grad_project/features/shared/chat/data/models/get_chats_info_model/chat_info_model.dart';
import 'package:grad_project/features/shared/chat/presentation/view/chat_view.dart';
import 'package:grad_project/features/shared/more/presentation/view/transactions_view.dart';
import 'package:grad_project/features/shared/more/presentation/view/wallet_withdraw_view.dart';
import 'package:grad_project/features/shared/more/presentation/view/widgets/about.dart';
import 'package:grad_project/features/shared/more/presentation/view/widgets/contact_us.dart';
import 'package:grad_project/features/shared/more/presentation/view/widgets/privacy.dart';
import 'package:grad_project/features/shared/more/presentation/view/widgets/terms.dart';
import 'package:grad_project/features/shared/notifications/presentation/view/notification_view.dart';
import 'package:grad_project/features/provider/profile/presentation/view/my_reviews_view.dart';
import 'package:grad_project/features/provider/profile/presentation/view/my_services_view.dart';
import 'package:grad_project/features/provider/profile/presentation/view/my_gallery_view.dart';
import 'package:grad_project/features/provider/profile/presentation/view/service_provider_profile.dart';
import 'package:grad_project/features/shared/on_boarding/presentation/view/on_boarding_view.dart';
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
          final extra = state.extra as Map<String, dynamic>;
          final service = extra['service'];
          final showBuyOrOffer = extra['showBuyOrOffer'] as bool? ?? false;
          final showDiscountButton =
              extra['showDiscountButton'] as bool? ?? false;

          return ViewServiceView(
            service: service,
            showBuyOrOffer: showBuyOrOffer,
            showDiscountButton: showDiscountButton,
          );
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
      path: RouterPath.userProfile,
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
        return PaymentView(
          paymentUrl: paymentUrl,
        );
      },
    ),
    GoRoute(
        path: RouterPath.providerHome,
        builder: (context, state) => const ServiceProviderHomeView()),
    GoRoute(
        path: RouterPath.providerProfile,
        builder: (context, state) => ServiceProviderProfile(
              providerProfileModel: state.extra as ProviderProfileModel,
            )),
    GoRoute(
        path: RouterPath.myReviewsView,
        builder: (context, state) => MyReviewsView(
              reviews: state.extra as List<Review?>,
            )),
    GoRoute(
        path: RouterPath.myServicesView,
        builder: (context, state) => MyServicesView(
              services: state.extra as List<ProviderService>,
            )),
    GoRoute(
        path: RouterPath.myWorkView,
        builder: (context, state) => MyWorkView(
              servicesgallery: state.extra as List<GalleryService>,
            )),
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
      builder: (context, state) {
        return const DiscountsView();
      },
    ),
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
    GoRoute(
        path: RouterPath.getServiceView,
        builder: (context, state) =>
            GetServiceView(serviceId: state.extra as String)),
    GoRoute(
        path: RouterPath.chatView,
        builder: (context, state) => ChatView(
              chat: state.extra as ChatInfoModel,
            )),
    GoRoute(
        path: RouterPath.privacyPolicyView,
        builder: (context, state) => const PrivacyPolicyView()),
    GoRoute(
        path: RouterPath.termsView,
        builder: (context, state) => const TermsView()),
    GoRoute(
        path: RouterPath.providerServiceView,
        builder: (context, state) => ProviderServiceView(
              serviceId: state.extra as String,
            )),
    GoRoute(
        path: RouterPath.editServiceView,
        builder: (context, state) => EditServiceView(
              service: state.extra as ProviderService,
            )),
    GoRoute(
        path: RouterPath.editProviderProfile,
        builder: (context, state) => EditProfileView(
              providerProfileModel: state.extra as ProviderProfileModel,
            )),
    GoRoute(
        path: RouterPath.providerGalleryServiceView,
        builder: (context, state) => ProviderGalleryServiceView(
              serviceId: state.extra as String,
            )),
    GoRoute(
        path: RouterPath.addGalleryServiceView,
        builder: (context, state) => const AddGalleryServiceView()),
    GoRoute(
        path: RouterPath.onBoardingView,
        builder: (context, state) => const OnBoardingView()),
    GoRoute(
        path: RouterPath.aboutView,
        builder: (context, state) => const AboutView()),
    GoRoute(
        path: RouterPath.contactUsView,
        builder: (context, state) => const ContactUsView()),
    GoRoute(
        path: RouterPath.inProgressServicesView,
        builder: (context, state) => InProgressServicesView(
              services: state.extra as List<RequestService>,
            )),
    GoRoute(
        path: RouterPath.inProgressServiceView,
        builder: (context, state) => InProgressServiceView(
              service: state.extra as RequestService,
            )),
    GoRoute(
        path: RouterPath.serviceOffersScreen,
        builder: (context, state) => ServiceOffersScreen(
              serviceId: state.extra as String,
            )),
    GoRoute(
        path: RouterPath.transactionsView,
        builder: (context, state) => const TransactionsView()),
    GoRoute(
        path: RouterPath.walletWithdrawView,
        builder: (context, state) => const WalletWithdrawView()),
  ]);
}
