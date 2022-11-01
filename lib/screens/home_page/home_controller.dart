import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_fake/enum/load_status.dart';
import 'package:tiktok_fake/model/video_model/video_model.dart';

class HomeController extends GetxController {
  LoadStatus loadStatus = LoadStatus.initial;
  late TabController tabController;
  PageController controller = PageController();
  PageController controller1 = PageController();

  List<VideoModel> listVideo = [];
}
