import 'package:flutter/material.dart';
import 'package:grad_project/features/user/home/presentation/views/widgets/user_home_view_body.dart';

import 'emergency_view.dart';
import 'points_entry_view.dart';
import 'user_profile_view.dart';
import 'widgets/user_bottom_navigation_bar.dart';

class UserHomeView extends StatefulWidget {
  const UserHomeView({super.key});

  @override
  State<UserHomeView> createState() => _UserHomeViewState();
}

class _UserHomeViewState extends State<UserHomeView> {
  List<Widget> homeWidgets = <Widget>[
    const UserHomeViewBody(),
    const PointsEntryView(),
   const EmergencyView(),
    // const MoreView()
  ];

  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: UserBottomNavigationBar(
        onChange: (index) {
          pageController.jumpToPage(index);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SafeArea(
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
