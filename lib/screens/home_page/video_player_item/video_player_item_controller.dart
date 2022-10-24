import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItemController extends GetxController {
  late VideoPlayerController videoController;
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
