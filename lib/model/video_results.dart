import 'package:json_annotation/json_annotation.dart';
import 'package:tiktok_fake/model/video_model.dart';

part 'video_results.g.dart';

@JsonSerializable()
class VideoResult {
  List<VideoModel>? data;

  VideoResult({this.data});

  factory VideoResult.fromJson(Map<String, dynamic> json) =>
      _$VideoResultFromJson(json);
  Map<String, dynamic> toJson() => _$VideoResultToJson(this);
}
