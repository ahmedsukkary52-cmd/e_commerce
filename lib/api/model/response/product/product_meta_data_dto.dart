import 'package:json_annotation/json_annotation.dart';

part 'product_meta_data_dto.g.dart';

@JsonSerializable()
class ProductMetadataDto {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "numberOfPages")
  final int? numberOfPages;
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "nextPage")
  final int? nextPage;

  ProductMetadataDto({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  factory ProductMetadataDto.fromJson(Map<String, dynamic> json) {
    return _$ProductMetadataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductMetadataDtoToJson(this);
  }
}
