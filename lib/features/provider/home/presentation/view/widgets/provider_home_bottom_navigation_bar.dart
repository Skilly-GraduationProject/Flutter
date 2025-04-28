import 'package:flutter/material.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/text_style_manager.dart';

class ProviderHomeBottomNavigationBar extends StatefulWidget {
  const ProviderHomeBottomNavigationBar({super.key, required this.onChange});
  final Function(int) onChange;
  @override
  State<ProviderHomeBottomNavigationBar> createState() =>
      _ProviderHomeBottomNavigationBarState();
}

class _ProviderHomeBottomNavigationBarState
    extends State<ProviderHomeBottomNavigationBar> {
  List<BottomNavigationBarItem> bottomBarItems = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'الرئيسية',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.chat_bubble_outline_rounded,
      ),
      label: 'المحادثات',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.notifications,
      ),
      label: 'الاشعارات',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.menu_rounded,
      ),
      label: 'المزيد',
    ),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(splashFactory: NoSplash.splashFactory),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        elevation: 0,
        backgroundColor: Colors.white,
        enableFeedback: false,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: TextStyleManager.style12BoldPrimary,
        unselectedLabelStyle: TextStyleManager.style12BoldPrimary,
        selectedIconTheme:
            const IconThemeData(size: 24, color: ColorManager.secondary),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          widget.onChange(_selectedIndex);
        },
        selectedItemColor: ColorManager.secondary,
        unselectedItemColor: ColorManager.darkGrey,
        items: bottomBarItems,
      ),
    );
  }
}
