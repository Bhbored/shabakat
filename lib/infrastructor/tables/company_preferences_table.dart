import 'package:drift/drift.dart';

class CompanyPreferences extends Table {
  TextColumn get id => text().unique()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get companyId => text()();
  RealColumn get pricePerKilowat => real()();
  RealColumn get pricePerAmp => real()();
  RealColumn get fixedCharge => real()();
  RealColumn get tva => real()();
  TextColumn get language => text().withDefault(const Constant('en'))();
  IntColumn get triggerDate => integer()();
  TextColumn get triggerMessage => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
