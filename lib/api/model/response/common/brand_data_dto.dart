import 'package:json_annotation/json_annotation.dart';

part 'brand_data_dto.g.dart';

@JsonSerializable()
class DataDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;

  DataDto({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory DataDto.fromJson(Map<String, dynamic> json) {
    return _$DataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataDtoToJson(this);
  }
}
