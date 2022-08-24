import 'package:flutter_shutter/Model/AssetsModel/AssetsModel.dart';
import 'package:flutter_shutter/Model/ContributorModel/ContributorModel.dart';

import 'package:json_annotation/json_annotation.dart';


part 'DataModel.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'id')
  String dataId;
  @JsonKey(name: 'aspect')
  dynamic aspect;
  @JsonKey(name: 'assets')
  Assets assets;
  @JsonKey(name: 'contributor')
  Contributor contributor;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'image_type')
  String imageType;
  @JsonKey(name: 'has_model_release')
  bool hasModelRelease;
  @JsonKey(name: 'media_type')
  String mediaType;
  Data(this.dataId, this.aspect, this.assets, this.contributor, this.description, this.imageType, this.hasModelRelease, this.mediaType);

  factory Data.fromJson(Map<String, dynamic> data) => _$DataFromJson(data);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

