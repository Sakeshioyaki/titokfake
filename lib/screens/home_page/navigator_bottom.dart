import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tiktok_fake/common/app_images.dart';
import 'package:tiktok_fake/common/app_text_styles.dart';
import 'package:tiktok_fake/screens/discovery_page/discovery_page.dart';
import 'package:tiktok_fake/screens/home_page/heart_animation/heart_animation.dart';
import 'package:tiktok_fake/screens/home_page/home_page.dart';
import 'package:tiktok_fake/screens/profile_page/profile_page.dart';

class NavigatorBottom extends StatefulWidget {
  const NavigatorBottom({
    super.key,
  });

  @override
  State<NavigatorBottom> createState() => _NavigatorBottomState();
}

class _NavigatorBottomState extends State<NavigatorBottom> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  void initState() {
    super.initState();
  }

  List<Widget> _buildScreens() => [
        const HomePage(),
        const DiscoveryPage(),
        const HeartAnimation(),
        const Center(
          child: Text('screen new'),
        ),
        ProfilePage(size: MediaQuery.of(context).size),
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
          icon: Column(
            children: [
              Image.asset(
                AppImages.icHome,
                width: 21,
              ),
              const SizedBox(height: 5),
              Text(
                'Trang chủ',
                style: AppTextStyle.textWhiterS10Bold,
              ),
            ],
          ),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: Column(
            children: [
              Image.asset(
                AppImages.icDiscover,
                width: 21,
              ),
              const SizedBox(height: 5),
              Text(
                'Khám phá',
                style: AppTextStyle.textWhiterS10Bold,
              ),
            ],
          ),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: Container(
            alignment: Alignment.topCenter,
            child: Image.asset(
              AppImages.icButtonCreate,
              width: 50,
            ),
          ),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: Column(
            children: [
              Image.asset(
                AppImages.icMessage,
                width: 21,
              ),
              const SizedBox(height: 5),
              Text(
                'Hộp thư',
                style: AppTextStyle.textWhiterS10Bold,
              ),
            ],
          ),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: Column(
            children: [
              Image.asset(
                AppImages.icAccount,
                width: 21,
              ),
              const SizedBox(height: 5),
              Text(
                'Hồ sơ',
                style: AppTextStyle.textWhiterS10Bold,
              ),
            ],
          ),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        navBarHeight: 80,
        padding: const NavBarPadding.only(top: 12),
        backgroundColor: Colors.black,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        decoration: const NavBarDecoration(
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style6,
      ),
    );
  }
}
