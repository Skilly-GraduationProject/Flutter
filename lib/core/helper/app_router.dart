import 'package:go_router/go_router.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/features/provider/home/data/models/get_requested_services_model/service.dart';
import 'package:grad_project/features/provider/home/data/models/provider_profile/provider_profile.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_gallery_model/servicesgallery.dart';
import 'package:grad_project/features/provider/profile/data/models/get_my_services_model/service.dart';
import 'package:grad_project/features/provider/profile/data/models/get_reviews_model/review.dart';
import 'package:grad_project/features/provider/profile/presentation/view/edit_profile_view.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/add_gallery_service_view.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/edit_service_view.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/provider_gallery_service_view.dart';
import 'package:grad_project/features/provider/provider_service.dart/presentation/provider_service_view.dart';
import 'package:grad_project/features/provider/requested_service/presentation/add_service_view.dart';
import 'package:grad_project/features/provider/home/presentation/view/service_provider_home_view.dart';
import 'package:grad_project/features/provider/requested_service/presentation/get_service_view.dart';
import 'package:grad_project/features/shared/chat/data/models/get_chats_info_model/chat_info_model.dart';
import 'package:grad_project/features/shared/chat/presentation/view/chat_view.dart';
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
import '../../features/user/home/presentation/views/category_view.dart';
import '../../features/user/home/presentation/views/request_service_view.dart';
import '../../features/user/home/presentation/views/user_profile_view.dart';
import '../../features/user/home/presentation/views/view_service_view.dart';

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
        path: '/viewService',
        builder: (context, state) => const ViewServiceView()),
    GoRoute(
        path: '/category',
        builder: (context, state) => const CategoryView(
              categoryId: '',
              categoryName: '',
            )),
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
        path: RouterPath.getServiceView,
        builder: (context, state) =>
            GetServiceView(service: state.extra as RequestedService)),
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
  ],
  );
}
