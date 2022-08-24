// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ImageModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) {
  return ImageModel(
    page: json['page'] as int?,
    perPage: json['per_page'] as int?,
    totalCount: json['total_count'] as int?,
    searchId: json['search_id'] as String?,
    imageListData: (json['data'] as List<dynamic>?)
        ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total_count': instance.totalCount,
      'search_id': instance.searchId,
      'data': instance.imageListData,
    };
