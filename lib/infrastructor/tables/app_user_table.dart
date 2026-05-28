import 'package:drift/drift.dart';

@DataClassName('AppUser')
class AppUsers extends Table {
  TextColumn get id => text()();
  TextColumn get email => text().nullable()();
  TextColumn get phoneNumber => text().nullable()();
  BoolColumn get isBanned => boolean().withDefault(const Constant(false))();
  TextColumn get companyName => text().withDefault(const Constant(''))();
  TextColumn get logoUrl => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
