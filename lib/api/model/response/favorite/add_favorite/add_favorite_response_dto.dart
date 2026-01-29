import 'package:json_annotation/json_annotation.dart';

part 'add_favorite_response_dto.g.dart';

@JsonSerializable()
class AddFavoriteResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<String>? data;

  AddFavoriteResponseDto({this.status, this.message, this.data});

  factory AddFavoriteResponseDto.fromJson(Map<String, dynamic> json) {
    return _$AddFavoriteResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddFavoriteResponseDtoToJson(this);
  }
}
