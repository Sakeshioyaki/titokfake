import 'package:get/get.dart';

class RightPanelVM extends GetxController {
  bool isLikeAction = false;

  void setLikeAction() {
    print('update');
    isLikeAction = isLikeAction ? false : true;
    update();
  }
}
