import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tiktok_fake/model/video_results.dart';

class VideoRepository {
  Future<VideoResult> getVideos() async {
    var data = await rootBundle.loadString("assets/json/data_json.json");
    var jsonResult = json.decode(data);
    return VideoResult.fromJson(jsonResult);
  }
}
