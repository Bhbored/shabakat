import 'package:drift/drift.dart' show Value;
import 'package:shabakat/core/network/dto/request/distribution_box/create_distribution_box_request.dart';
import 'package:shabakat/core/network/dto/request/distribution_box/update_distribution_box_request.dart';
import 'package:shabakat/core/network/dto/response/distribution_box/distribution_box_response.dart';
import 'package:shabakat/domain/entities/distribution_box/distribution_box.dart';
import 'package:shabakat/infrastructor/db/database.dart' as drift;

extension DistributionBoxResponseMapper on DistributionBoxResponse {
  DistributionBox toEntity() => DistributionBox(
    id: id,
    name: name,
    areaId: areaId,
    areaName: areaName,
    locationNote: locationNote,
    notes: notes,
    customerCount: customerCount,
    createdAt: createdAt,
  );
}

extension DistributionBoxEntityMapper on DistributionBox {
  drift.DistributionBoxesCompanion toCompanion() =>
      drift.DistributionBoxesCompanion(
        id: Value(id),
        name: Value(name),
        areaId: Value(areaId),
        areaName: Value(areaName),
        locationNote: Value(locationNote),
        notes: Value(notes),
        customerCount: Value(customerCount),
        createdAt: Value(createdAt),
      );

  CreateDistributionBoxRequest toCreateRequest() => CreateDistributionBoxRequest(
    name: name,
    areaId: areaId,
    locationNote: locationNote,
    notes: notes,
  );

  UpdateDistributionBoxRequest toUpdateRequest() => UpdateDistributionBoxRequest(
    name: name,
    areaId: areaId,
    locationNote: locationNote,
    notes: notes,
  );
}

extension DistributionBoxDriftMapper on drift.DistributionBox {
  DistributionBox toEntity() => DistributionBox(
    id: id,
    name: name,
    areaId: areaId,
    areaName: areaName,
    locationNote: locationNote,
    notes: notes,
    customerCount: customerCount,
    createdAt: createdAt,
  );
}
