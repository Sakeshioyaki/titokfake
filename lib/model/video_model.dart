import 'package:json_annotation/json_annotation.dart';

part 'video_model.g.dart';

@JsonSerializable()
class VideoModel {
  String? videoUrl;
  String? name;
  String? caption;
  String? songName;
  String? profileImg;
  String? likes;
  String? comments;
  String? shares;
  String? albumImg;
  String? bookMark;

  VideoModel(
    this.name,
    this.caption,
    this.songName,
    this.profileImg,
    this.likes,
    this.comments,
    this.shares,
    this.albumImg,
    this.videoUrl,
    this.bookMark,
  );
  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}
