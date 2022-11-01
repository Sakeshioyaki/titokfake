import 'package:get/get.dart';

class AppControl extends GetxController {
  bool isLogin = false;
  void setIsLogin() {
    isLogin = true;
    update();
  }
}
