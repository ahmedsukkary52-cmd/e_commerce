import 'package:e_commerce/api/model/response/product/product_data_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_favorite_response_dto.g.dart';

@JsonSerializable()
class GetFavoriteResponseDto {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "count")
  final int? count;
  @JsonKey(name: "data")
  final List<ProductDataDto>? data;

  GetFavoriteResponseDto({this.status, this.count, this.data});

  factory GetFavoriteResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetFavoriteResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetFavoriteResponseDtoToJson(this);
  }
}
