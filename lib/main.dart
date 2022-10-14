import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tiktok_fake/common/app_images.dart';
import 'package:tiktok_fake/common/app_text_styles.dart';
import 'package:tiktok_fake/screen/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() => [
        const HomePage(),
        const Center(
          child: Text('screen new'),
        ),
        const Center(
          child: Text('screen new'),
        ),
        const Center(
          child: Text('screen new'),
        ),
        const Center(
          child: Text('screen new'),
        ),
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
                'Home',
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
                AppImages.icSearch,
                width: 21,
              ),
              const SizedBox(height: 5),
              Text(
                'Search',
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
                'Inbox',
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
                'Me',
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
        stateManagement: true, // Default is true.
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
