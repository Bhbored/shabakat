import 'package:shabakat/core/network/dto/response/area/area_response.dart';
import 'package:shabakat/domain/entities/area/area.dart';

extension AreaResponseMapper on AreaResponse {
  Area toEntity() => Area(
    id: id,
    createdAt: createdAt,
    updatedAt: createdAt,
    companyId: '',
    name: name,
  );
}
