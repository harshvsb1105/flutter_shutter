import 'package:json_annotation/json_annotation.dart';
part 'ContributorModel.g.dart';

@JsonSerializable()
class Contributor {

  @JsonKey(name: 'id')
  String applicationID;

  Contributor(this.applicationID);

  factory Contributor.fromJson(Map<String, dynamic> data) => _$ContributorFromJson(data);
  Map<String, dynamic> toJson() => _$ContributorToJson(this);
}
