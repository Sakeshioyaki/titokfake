import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tiktok_fake/enum/load_status.dart';
import 'package:tiktok_fake/model/video_model.dart';
import 'package:tiktok_fake/model/video_results.dart';
import 'package:tiktok_fake/repositories/video_repository.dart';

class HomeController extends GetxController {
  LoadStatus loadStatus = LoadStatus.initial;
  late TabController tabController;
  PageController controller = PageController();
  PageController controller1 = PageController();

  late VideoRepository videoRepository;
  List<VideoModel> listVideo = [];

  void fetchInitialMovies() async {
    loadStatus = LoadStatus.loading;
    try {
      var data = await rootBundle.loadString("assets/json/data_json.json");
      var jsonResult = json.decode(data);
      VideoResult.fromJson(jsonResult);
      final res = VideoResult.fromJson(jsonResult);
      listVideo = res.data!;
    } catch (e) {
      print(e);
    }
    update();
  }
}
