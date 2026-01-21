import 'package:e_commerce/api/model/response/brand/brand_data_dto.dart';

import '../../../Domain/entities/response/brand/brand_data.dart';

extension BrandMapper on DataDto {
  Data toData() {
    return Data(
      name: name,
      createdAt: createdAt,
      id: id,
      image: image,
      slug: slug,
      updatedAt: updatedAt,
    );
  }
}
