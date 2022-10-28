// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => VideoModel(
      json['name'] as String?,
      json['caption'] as String?,
      json['songName'] as String?,
      json['profileImg'] as String?,
      json['likes'] as String?,
      json['comments'] as String?,
      json['shares'] as String?,
      json['albumImg'] as String?,
      json['videoUrl'] as String?,
      json['bookMark'] as String?,
    );

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'videoUrl': instance.videoUrl,
      'name': instance.name,
      'caption': instance.caption,
      'songName': instance.songName,
      'profileImg': instance.profileImg,
      'likes': instance.likes,
      'comments': instance.comments,
      'shares': instance.shares,
      'albumImg': instance.albumImg,
      'bookMark': instance.bookMark,
    };
