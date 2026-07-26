import 'package:drift/drift.dart' show Value;
import 'package:shabakat/core/network/dto/response/area/area_response.dart';
import 'package:shabakat/domain/entities/area/area.dart';
import 'package:shabakat/infrastructor/db/database.dart' as drift;

extension AreaResponseMapper on AreaResponse {
  Area toEntity() => Area(
    id: id,
    createdAt: createdAt,
    updatedAt: createdAt,
    companyId: '',
    name: name,
    customerCount: customerCount,
  );
}

extension AreaEntityMapper on Area {
  drift.AreasCompanion toCompanion() => drift.AreasCompanion(
    id: Value(id),
    createdAt: Value(createdAt),
    updatedAt: Value(updatedAt),
    name: Value(name),
    customerCount: Value(customerCount),
  );
}

extension AreaDriftMapper on drift.Area {
  Area toEntity() => Area(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    companyId: '',
    name: name,
    customerCount: customerCount,
  );
}
