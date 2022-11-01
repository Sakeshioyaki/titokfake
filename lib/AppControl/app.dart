import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_fake/AppControl/app_controll.dart';
import 'package:tiktok_fake/AppControl/user_controller.dart';
import 'package:tiktok_fake/screens/auth_page/auth_controller.dart';
import 'package:tiktok_fake/screens/splash_page/splash_page.dart';

Future initService() async {
  Get.lazyPut<AppControl>(() => AppControl());
  Get.put<AuthController>(AuthController());
  Get.put<UserController>(UserController());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AppControl appControl = Get.find<AppControl>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppControl>(builder: (logic) {
      return const GetMaterialApp(
        home: SplashPage(),
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
