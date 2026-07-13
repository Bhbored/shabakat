import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:shabakat/domain/entities/area/area.dart';
import 'package:shabakat/domain/mappers/area/area_mapper.dart';
import 'package:shabakat/infrastructor/db/database.dart' as drift;

class AreaRepo {
  late final drift.AppDatabase _db;
  final _logger = Logger();

  AreaRepo(this._db);

  Future<List<Area>> getAllAreas() async {
    try {
      final select = _db.select(_db.areas);
      final query = select..orderBy([(a) => OrderingTerm.desc(a.createdAt)]);

      final rows = await query.get();
      final areas = rows.map((e) => e.toEntity()).toList();
      _logger.i('Areas retrieved from local DB: ${areas.length}');
      return areas;
    } catch (e, st) {
      _logger.e(
        'Failed to retrieve areas from local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<Area?> getAreaById(String id) async {
    try {
      final row = await (_db.select(_db.areas)..where((a) => a.id.equals(id)))
          .getSingleOrNull();
      _logger.i('Area retrieved from local DB by id: $id');
      return row?.toEntity();
    } catch (e, st) {
      _logger.e(
        'Failed to retrieve area from local DB by id $id: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<void> addArea(Area area) async {
    try {
      await _db.into(_db.areas).insert(
            area.toCompanion(),
            mode: InsertMode.insertOrReplace,
          );
      _logger.i('Area added to local DB: ${area.id}');
    } catch (e, st) {
      _logger.e(
        'Failed to add area to local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<void> bulkAddAreas(List<Area> areas) async {
    try {
      await _db.batch((b) {
        for (final area in areas) {
          b.insert(
            _db.areas,
            area.toCompanion(),
            mode: InsertMode.insertOrReplace,
          );
        }
      });
      _logger.i('Bulk added areas to local DB: ${areas.length}');
    } catch (e, st) {
      _logger.e(
        'Failed to bulk add areas to local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<int> getTotalAreasCount() async {
    try {
      final count = _db.areas.id.count();
      final query = _db.selectOnly(_db.areas)..addColumns([count]);
      final row = await query.getSingle();
      final total = row.read(count) ?? 0;
      _logger.i('Total areas count from local DB: $total');
      return total;
    } catch (e, st) {
      _logger.e(
        'Failed to get total areas count from local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<int> deleteAreaById(String id) async {
    try {
      final deleted = await (_db.delete(_db.areas)..where((a) => a.id.equals(id)))
          .go();
      _logger.i('Deleted area from local DB by id: $id ($deleted rows)');
      return deleted;
    } catch (e, st) {
      _logger.e(
        'Failed to delete area from local DB by id $id: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<int> bulkDeleteAreas() async {
    try {
      final deleted = await (_db.delete(_db.areas)).go();
      _logger.i('Bulk deleted all areas from local DB: $deleted rows');
      return deleted;
    } catch (e, st) {
      _logger.e(
        'Failed to bulk delete areas from local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }
}
