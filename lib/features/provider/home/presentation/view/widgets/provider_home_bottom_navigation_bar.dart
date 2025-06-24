import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grad_project/core/extensions/context_extension.dart';
import 'package:grad_project/core/managers/color_manager.dart';
import 'package:grad_project/core/managers/icon_manager.dart';
import 'package:grad_project/core/managers/image_manager.dart';
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
  int _selectedIndex = 0;

  List<BottomNavigationBarItem> bottomBarItems = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      activeIcon: NavIcon(
        icon: IconManager.homeIcon,
        forActive: true,
      ),
      icon: NavIcon(
        icon: IconManager.homeIcon,
      ),
      label: 'الرئيسية',
    ),
    const BottomNavigationBarItem(
      activeIcon: NavIcon(
        icon: IconManager.chat,
        forActive: true,
      ),
      icon: NavIcon(
        icon: IconManager.chat,
      ),
      label: 'المحادثات',
    ),
    const BottomNavigationBarItem(
      activeIcon: NavIcon(
        icon: IconManager.notificationIcon,
        forActive: true,
      ),
      icon: NavIcon(
        icon: IconManager.notificationIcon,
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
        // selectedIconTheme:
        //     const IconThemeData(size: 24, color: ColorManager.secondary),
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

class NavIcon extends StatelessWidget {
  const NavIcon({super.key, required this.icon, this.forActive = false});
  final String icon;
  final bool? forActive;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      colorFilter: ColorFilter.mode(
          forActive! ? ColorManager.secondary : ColorManager.darkGrey,
          BlendMode.srcIn),
      height: context.responsiveHeight(24),
    );
  }
}
