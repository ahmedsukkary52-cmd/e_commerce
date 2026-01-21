import 'package:e_commerce/api/model/response/product/product_data_dto.dart';
import 'package:e_commerce/api/model/response/product/product_meta_data_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_response_dto.g.dart';

@JsonSerializable()
class ProductResponseDto {
  @JsonKey(name: "results")
  final int? results;
  @JsonKey(name: "metadata")
  final ProductMetadataDto? metadata;
  @JsonKey(name: "data")
  final List<ProductDataDto>? data;

  ProductResponseDto({this.results, this.metadata, this.data});

  factory ProductResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ProductResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductResponseDtoToJson(this);
  }
}
