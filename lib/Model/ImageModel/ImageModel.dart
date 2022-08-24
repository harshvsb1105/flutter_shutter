import 'package:flutter/cupertino.dart';
import 'package:flutter_shutter/Model/DataModel/DataModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ImageModel.g.dart';

@JsonSerializable()
class ImageModel {
  @JsonKey(name: 'page')
   int? page;
  @JsonKey(name: 'per_page')
   int? perPage;
  @JsonKey(name: 'total_count')
   int? totalCount;
  @JsonKey(name: 'search_id')
   String? searchId;
  @JsonKey(name: 'data')
   List<Data>? imageListData;


  ImageModel({this.page, this.perPage, this.totalCount, this.searchId, this.imageListData});

  factory ImageModel.fromJson(Map<String, dynamic> data) {
    debugPrint('INSIDE fromJSON--------- of ImageModel ${data.length}');
    return _$ImageModelFromJson(data);
  }

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}

