import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isScrolling = false;
  void setIsScrolling() {
    isScrolling = isScrolling ? false : true;
    update();
  }
}
