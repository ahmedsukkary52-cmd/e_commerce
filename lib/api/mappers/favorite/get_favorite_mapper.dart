import 'package:e_commerce/Domain/entities/response/favorite/get_favorite/get_favorite_response_dto.dart';
import 'package:e_commerce/api/mappers/product/product_mapper.dart';
import 'package:e_commerce/api/model/response/favorite/get_favorite/get_favorite_response_dto.dart';

extension GetFavoriteMapper on GetFavoriteResponseDto {
  GetFavoriteResponse toFavoriteResponse() {
    return GetFavoriteResponse(
      data: data?.map((dataDto) => dataDto.toProductData()).toList(),
      status: status,
      count: count,
    );
  }
}
