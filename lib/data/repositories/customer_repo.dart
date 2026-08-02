import 'package:drift/drift.dart';
import 'package:logger/logger.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/domain/entities/customers/customer.dart';
import 'package:shabakat/domain/mappers/customer/customer_mapper.dart';
import 'package:shabakat/infrastructor/db/database.dart' as drift;

class CustomerRepo {
  late final drift.AppDatabase _db;
  final _logger = Logger();

  CustomerRepo(this._db);

  Future<List<Customer>> getAllCustomers(
    String? name,
    String? phone,
    String? areaId,
    String? boxId,
    PlanType? planType,
    CustomerRelation? customerRelation,
    CustomerStatus? customerStatus, {
    int pageNumber = 1,
    int pageSize = 10,
  }) async {
    try {
      final select = _db.select(_db.customers);
      final expressions = await _customerFilterExpressions(
        name: name,
        phone: phone,
        areaId: areaId,
        boxId: boxId,
        planType: planType,
        customerRelation: customerRelation,
        customerStatus: customerStatus,
      );
      if (expressions.isNotEmpty) {
        select.where((c) => expressions.reduce((a, b) => a & b));
      }
      final query = select
        ..orderBy([(c) => OrderingTerm.desc(c.createdAt)])
        ..limit(pageSize, offset: (pageNumber - 1) * pageSize);
      final rows = await query.get();
      final customers = rows.map((e) => e.toEntity()).toList();
      _logger.i('Customers retrieved from local DB: ${customers.length}');
      return customers;
    } catch (e, st) {
      _logger.e(
        'Failed to retrieve customers from local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<List<Expression<bool>>> _customerFilterExpressions({
    String? name,
    String? phone,
    String? areaId,
    String? boxId,
    PlanType? planType,
    CustomerRelation? customerRelation,
    CustomerStatus? customerStatus,
  }) async {
    final expressions = <Expression<bool>>[];
    if (name != null) expressions.add(_db.customers.name.like('%$name%'));
    if (phone != null) expressions.add(_db.customers.phone.like('%$phone%'));
    if (areaId != null) {
      final area = await (_db.select(
        _db.areas,
      )..where((a) => a.id.equals(areaId))).getSingleOrNull();
      if (area != null) {
        expressions.add(
          _db.customers.areaId.equals(areaId) |
              (_db.customers.areaId.isNull() &
                  _db.customers.areaName.equals(area.name)),
        );
      } else {
        expressions.add(_db.customers.areaId.equals(areaId));
      }
    }
    if (boxId != null) expressions.add(_db.customers.boxId.equals(boxId));
    if (planType != null) {
      expressions.add(_db.customers.plan.equals(planType.name));
    }
    if (customerRelation != null) {
      expressions.add(
        _db.customers.customerRelation.equals(customerRelation.name),
      );
    }
    if (customerStatus != null) {
      expressions.add(
        _db.customers.customerStatus.equals(customerStatus.name),
      );
    }
    return expressions;
  }

  Future<Customer?> getCustomerById(String id) async {
    try {
      final row = await (_db.select(
        _db.customers,
      )..where((c) => c.id.equals(id))).getSingleOrNull();
      _logger.i('Customer retrieved from local DB by id: $id');
      return row?.toEntity();
    } catch (e, st) {
      _logger.e(
        'Failed to retrieve customer from local DB by id $id: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<void> addCustomer(Customer customer) async {
    try {
      await _db
          .into(_db.customers)
          .insert(customer.toCompanion(), mode: InsertMode.insertOrReplace);
      _logger.i('Customer added to local DB: ${customer.id}');
    } catch (e, st) {
      _logger.e(
        'Failed to add customer to local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<void> bulkAddCustomers(List<Customer> customers) async {
    try {
      await _db.batch((b) {
        for (final customer in customers) {
          b.insert(
            _db.customers,
            customer.toCompanion(),
            mode: InsertMode.insertOrReplace,
          );
        }
      });
      _logger.i('Bulk added customers to local DB: ${customers.length}');
    } catch (e, st) {
      _logger.e(
        'Failed to bulk add customers to local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<int> getTotalCustomersCount({
    String? name,
    String? phone,
    String? areaId,
    String? boxId,
    PlanType? planType,
    CustomerRelation? customerRelation,
    CustomerStatus? customerStatus,
  }) async {
    try {
      final count = _db.customers.id.count();
      final query = _db.selectOnly(_db.customers)..addColumns([count]);
      final expressions = await _customerFilterExpressions(
        name: name,
        phone: phone,
        areaId: areaId,
        boxId: boxId,
        planType: planType,
        customerRelation: customerRelation,
        customerStatus: customerStatus,
      );
      if (expressions.isNotEmpty) {
        query.where(expressions.reduce((a, b) => a & b));
      }
      final row = await query.getSingle();
      final total = row.read(count) ?? 0;
      _logger.i('Total customers count from local DB: $total');
      return total;
    } catch (e, st) {
      _logger.e(
        'Failed to get total customers count from local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<List<String>> getCustomerIds() async {
    try {
      final idColumn = _db.customers.id;
      final rows = await (_db.selectOnly(
        _db.customers,
      )..addColumns([idColumn])).get();
      final ids = rows
          .map((row) => row.read(idColumn))
          .whereType<String>()
          .toList();
      _logger.i('Customer ids retrieved from local DB: ${ids.length}');
      return ids;
    } catch (e, st) {
      _logger.e(
        'Failed to get customer ids from local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<int> deleteCustomerById(String id) async {
    try {
      final deleted = await (_db.delete(
        _db.customers,
      )..where((c) => c.id.equals(id))).go();
      _logger.i('Deleted customer from local DB by id: $id ($deleted rows)');
      return deleted;
    } catch (e, st) {
      _logger.e(
        'Failed to delete customer from local DB by id $id: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<int> deleteCustomers(List<Customer> customers) async {
    try {
      final deleted = await (_db.delete(
        _db.customers,
      )..where((c) => c.id.isIn(customers.map((e) => e.id)))).go();
      _logger.i(
        'Deleted customers from local DB: ${customers.length} ($deleted rows)',
      );
      return deleted;
    } catch (e, st) {
      _logger.e(
        'Failed to delete customers from local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<int> bulkDeleteCustomers() async {
    try {
      final deleted = await (_db.delete(_db.customers)).go();
      _logger.i('Bulk deleted all customers from local DB: $deleted rows');
      return deleted;
    } catch (e, st) {
      _logger.e(
        'Failed to bulk delete customers from local DB: $e',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }
}
