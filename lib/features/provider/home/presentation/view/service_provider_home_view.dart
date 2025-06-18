import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helper/service_locator.dart';
import 'package:grad_project/features/provider/home/data/repo/home_repo.dart';
import 'package:grad_project/features/provider/home/presentation/manager/cubit/provider_home_cubit_cubit.dart'
    show ProviderHomeCubit;
import 'package:grad_project/features/provider/home/presentation/view/widgets/provider_home_bottom_navigation_bar.dart';
import 'package:grad_project/features/provider/home/presentation/view/widgets/service_provider_view_body.dart';
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
    return BlocProvider(
      create: (context) =>
          ProviderHomeCubit(homeRepo: getIt<ProviderHomeRepo>()),
      child: Scaffold(
        bottomNavigationBar: ProviderHomeBottomNavigationBar(
          onChange: (index) {
            pageController.jumpToPage(index);
          },
        ),
        body: SafeArea(
            top: false,
            child: PageView.builder(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => homeWidgets[index],
                itemCount: homeWidgets.length)),
      ),
    );
  }
}
