// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoResult _$VideoResultFromJson(Map<String, dynamic> json) => VideoResult(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => VideoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideoResultToJson(VideoResult instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
