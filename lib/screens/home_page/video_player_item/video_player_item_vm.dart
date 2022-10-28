import 'package:get/get.dart';

class VideoPlayerItemController extends GetxController {
  bool isShowPlaying = false;
  double opacity = 0.4;
  bool showIndicator = false;
  bool big = false;
  bool liked = false;
  bool showTime = false;
  bool showInfo = true;
  Duration process = const Duration(milliseconds: 0);
  late Duration total = const Duration(milliseconds: 0);
  late Duration buffered = const Duration(milliseconds: 0);
  bool isLikeAction = false;

  void setLikeAction(bool s) {
    print('update');
    isLikeAction = s;
    update();
  }

  void setLiked(bool s) {
    liked = s;
    update();
  }

  void setProcess(Duration s) {
    process = s;
    update();
  }

  void setTotal(Duration s) {
    total = s;
    update();
  }

  void setBuffered(Duration s) {
    buffered = s;
    update();
  }

  void setIsShowPlaying(bool s) {
    isShowPlaying = s;
    update();
  }

  void setOpacity(double opa) {
    opacity = opa;
    update();
  }

  void setBig(bool s) {
    big = s;
    update();
  }

  void setShowTime(bool s) {
    showTime = s;
    update();
  }

  void setShowInfo(bool s) {
    showInfo = s;
    update();
  }

  void setShowIndicator(bool s) {
    showIndicator = s;
    update();
  }
}
