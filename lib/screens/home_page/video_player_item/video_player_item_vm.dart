import 'package:get/get.dart';

class VideoPlayerItemController extends GetxController {
  bool isShowPlaying = false;
  double opacity = 0.4;
  bool showIndicator = false;
  bool big = false;
  bool showTime = false;
  bool showInfo = true;
  Duration process = const Duration(milliseconds: 0);
  late Duration total = const Duration(milliseconds: 0);
  int time = 0;

  setProcess(Duration s) {
    process = s;
    update();
  }

  setTotal(Duration s) {
    total = s;
    update();
  }

  setTime(int s) {
    print('set time ');
    time = s;
    update();
  }

  setIsShowPlaying(bool s) {
    isShowPlaying = s;
    update();
  }

  setOpacity(double opa) {
    opacity = opa;
    update();
  }

  setBig(bool s) {
    print('come set big is $s');
    isShowPlaying = s;
    update();
  }

  setShowTime(bool s) {
    showTime = s;
    update();
  }

  setShowInfo(bool s) {
    showInfo = s;
    update();
  }

  setShowIndicator(bool s) {
    showIndicator = s;
    update();
  }
}
