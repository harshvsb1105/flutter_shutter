import 'package:flutter_shutter/Model/PreviewModel/PreviewModel.dart';
import 'package:json_annotation/json_annotation.dart';


part 'AssetsModel.g.dart';

@JsonSerializable()
class Assets {
  @JsonKey(name: 'preview')
  Preview preview;
  @JsonKey(name: 'small_thumb')
  Preview smallThumb;
  @JsonKey(name: 'large_thumb')
  Preview largeThumb;
  @JsonKey(name: 'huge_thumb')
  Preview hugeThumb;
  @JsonKey(name: 'preview_1000')
  Preview preview1000;
  @JsonKey(name: 'preview_1500')
  Preview preview1500;

  Assets(this.preview, this.smallThumb, this.largeThumb, this.hugeThumb, this.preview1000, this.preview1500);


  factory Assets.fromJson(Map<String, dynamic> data) => _$AssetsFromJson(data);

  Map<String, dynamic> toJson() => _$AssetsToJson(this);
}
