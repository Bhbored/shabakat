import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:shabakat/domain/entities/distribution_box/distribution_box.dart';
import 'package:shabakat/domain/mappers/distribution_box/distribution_box_mapper.dart';
import 'package:shabakat/infrastructor/db/database.dart' as drift;

class DistributionBoxRepo {
  late final drift.AppDatabase _db;
  final _logger = Logger();

  DistributionBoxRepo(this._db);

  Future<List<DistributionBox>> getAllDistributionBoxes(
    String? areaId,
    String? name, {
    int pageNumber = 1,
    int pageSize = 10,
  }) async {
    try {
      final select = _db.select(_db.distributionBoxes);

      final expressions = <Expression<bool>>[];
      if (areaId != null) {
        expressions.add(_db.distributionBoxes.areaId.equals(areaId));
      }
      if (name != null) {
        expressions.add(_db.distributionBoxes.name.like('%$name%'));
      }
      if (expressions.isNotEmpty) {
        select.where((b) => expressions.reduce((a, b) => a & b));
      }
      final query = select
        ..orderBy([(b) => OrderingTerm.desc(b.createdAt)])
        ..limit(pageSize, offset: (pageNumber - 1) * pageSize);
      final rows = await query.get();
      final boxes = rows.map((e) => e.toEntity()).toList();
      _logger.i('Distribution boxes retrieved from local DB: ${boxes.length}');
      return boxes;
    } catch (e, st) {
      _logger.e(
        'Failed to retrieve distribution boxes from local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<DistributionBox?> getDistributionBoxById(String id) async {
    try {
      final row = await (_db.select(_db.distributionBoxes)
            ..where((b) => b.id.equals(id)))
          .getSingleOrNull();
      _logger.i('Distribution box retrieved from local DB by id: $id');
      return row?.toEntity();
    } catch (e, st) {
      _logger.e(
        'Failed to retrieve distribution box from local DB by id $id: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<void> addDistributionBox(DistributionBox box) async {
    try {
      await _db.into(_db.distributionBoxes).insert(
            box.toCompanion(),
            mode: InsertMode.insertOrReplace,
          );
      _logger.i('Distribution box added to local DB: ${box.id}');
    } catch (e, st) {
      _logger.e(
        'Failed to add distribution box to local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<void> bulkAddDistributionBoxes(List<DistributionBox> boxes) async {
    try {
      await _db.batch((b) {
        for (final box in boxes) {
          b.insert(
            _db.distributionBoxes,
            box.toCompanion(),
            mode: InsertMode.insertOrReplace,
          );
        }
      });
      _logger.i('Bulk added distribution boxes to local DB: ${boxes.length}');
    } catch (e, st) {
      _logger.e(
        'Failed to bulk add distribution boxes to local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<int> getTotalDistributionBoxesCount() async {
    try {
      final count = _db.distributionBoxes.id.count();
      final query = _db.selectOnly(_db.distributionBoxes)..addColumns([count]);
      final row = await query.getSingle();
      final total = row.read(count) ?? 0;
      _logger.i('Total distribution boxes count from local DB: $total');
      return total;
    } catch (e, st) {
      _logger.e(
        'Failed to get total distribution boxes count from local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<int> deleteDistributionBoxById(String id) async {
    try {
      final deleted = await (_db.delete(_db.distributionBoxes)
            ..where((b) => b.id.equals(id)))
          .go();
      _logger.i(
        'Deleted distribution box from local DB by id: $id ($deleted rows)',
      );
      return deleted;
    } catch (e, st) {
      _logger.e(
        'Failed to delete distribution box from local DB by id $id: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<int> deleteDistributionBoxes(List<DistributionBox> boxes) async {
    try {
      final deleted = await (_db.delete(_db.distributionBoxes)
            ..where((b) => b.id.isIn(boxes.map((e) => e.id))))
          .go();
      _logger.i(
        'Deleted distribution boxes from local DB: ${boxes.length} ($deleted rows)',
      );
      return deleted;
    } catch (e, st) {
      _logger.e(
        'Failed to delete distribution boxes from local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<int> bulkDeleteDistributionBoxes() async {
    try {
      final deleted = await (_db.delete(_db.distributionBoxes)).go();
      _logger.i(
        'Bulk deleted all distribution boxes from local DB: $deleted rows',
      );
      return deleted;
    } catch (e, st) {
      _logger.e(
        'Failed to bulk delete distribution boxes from local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }
}
