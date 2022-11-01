import 'package:get/get.dart';
import 'package:tiktok_fake/AppControl/app_controll.dart';
import 'package:tiktok_fake/screens/home_page/navigator_bottom.dart';

class SplashVm extends GetxController {
  // bool flagOpacity = false;
  AppControl appControl = Get.find<AppControl>();
  void init() async {
    Future.delayed(const Duration(milliseconds: 1500), () {
      Get.offAll(
        () => const NavigatorBottom(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 200),
      );
    });
  }
}
