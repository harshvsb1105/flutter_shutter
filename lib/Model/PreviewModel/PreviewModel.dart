import 'package:json_annotation/json_annotation.dart';


part 'PreviewModel.g.dart';

@JsonSerializable()
class Preview {
  @JsonKey(name: 'height')
  int height;
  @JsonKey(name: 'url')
  String url;
  @JsonKey(name: 'width')
  int width;

  Preview(this.height, this.url, this.width);

  factory Preview.fromJson(Map<String, dynamic> data) => _$PreviewFromJson(data);

  Map<String, dynamic> toJson() => _$PreviewToJson(this);
}
