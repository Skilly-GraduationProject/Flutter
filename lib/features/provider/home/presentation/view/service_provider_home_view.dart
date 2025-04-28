import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';
import 'package:grad_project/core/navigation/router_path.dart';
import 'package:grad_project/features/provider/home/presentation/view/widgets/provider_home_bottom_navigation_bar.dart';
import 'package:grad_project/features/provider/home/presentation/view/widgets/service_provider_view_body.dart';
import 'package:grad_project/features/provider/profile/presentation/view/service_provider_profile.dart';
import 'package:grad_project/features/shared/chat/presentation/view/chats_view.dart';
import 'package:grad_project/features/shared/more/presentation/view/more_view.dart';
import 'package:grad_project/features/shared/notifications/presentation/view/notification_view.dart';

class ServiceProviderHomeView extends StatefulWidget {
  const ServiceProviderHomeView({super.key});

  @override
  State<ServiceProviderHomeView> createState() =>
      _ServiceProviderHomeViewState();
}

class _ServiceProviderHomeViewState extends State<ServiceProviderHomeView> {
  List<Widget> homeWidgets = <Widget>[
    const ServiceProviderViewBody(),
    const ChatsView(),
    const NotificationView(),
    const MoreView()
  ];

  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ProviderHomeBottomNavigationBar(
        onChange: (index) {
          pageController.jumpToPage(index);
        },
      ),
      body: SafeArea(
          child: PageView.builder(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => homeWidgets[index],
              itemCount: homeWidgets.length)),
    );
  }
}
