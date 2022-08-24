// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DataModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['id'] as String,
    json['aspect'],
    Assets.fromJson(json['assets'] as Map<String, dynamic>),
    Contributor.fromJson(json['contributor'] as Map<String, dynamic>),
    json['description'] as String,
    json['image_type'] as String,
    json['has_model_release'] as bool,
    json['media_type'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.dataId,
      'aspect': instance.aspect,
      'assets': instance.assets,
      'contributor': instance.contributor,
      'description': instance.description,
      'image_type': instance.imageType,
      'has_model_release': instance.hasModelRelease,
      'media_type': instance.mediaType,
    };
