// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AssetsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Assets _$AssetsFromJson(Map<String, dynamic> json) {
  return Assets(
    Preview.fromJson(json['preview'] as Map<String, dynamic>),
    Preview.fromJson(json['small_thumb'] as Map<String, dynamic>),
    Preview.fromJson(json['large_thumb'] as Map<String, dynamic>),
    Preview.fromJson(json['huge_thumb'] as Map<String, dynamic>),
    Preview.fromJson(json['preview_1000'] as Map<String, dynamic>),
    Preview.fromJson(json['preview_1500'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AssetsToJson(Assets instance) => <String, dynamic>{
      'preview': instance.preview,
      'small_thumb': instance.smallThumb,
      'large_thumb': instance.largeThumb,
      'huge_thumb': instance.hugeThumb,
      'preview_1000': instance.preview1000,
      'preview_1500': instance.preview1500,
    };
