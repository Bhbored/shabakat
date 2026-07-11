import 'package:shabakat/domain/entities/customers/customer.dart';
import 'package:shabakat/domain/mappers/customer/customer_mapper.dart';
import 'package:shabakat/infrastructor/db/database.dart' as drift;

class CustomerRepo {
  late final drift.AppDatabase _db;

  CustomerRepo(this._db);

  Future<void> addCustomer(Customer customer) async {
    await _db.into(_db.customers).insert(customer.toCompanion());
  }

  Future<List<Customer>> getAllCustomers() async {
    return await _db
        .select(_db.customers)
        .get()
        .then((value) => value.map((e) => e.toEntity()).toList());
  }

  Future<Customer?> getCustomerById(String id) async {
    return await (_db.select(_db.customers)..where((c) => c.id.equals(id)))
        .getSingleOrNull()
        .then((value) => value?.toEntity());
  }
}
