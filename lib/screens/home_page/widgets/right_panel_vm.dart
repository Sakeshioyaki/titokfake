import 'package:get/get.dart';

class RightPanelVM extends GetxController {
  bool isLike = false;

  void setLike() {
    print('update');
    isLike = isLike ? false : true;
    update();
  }
}
