import 'package:drift/drift.dart';
import 'app_user_table.dart';

@DataClassName('CompanyPreferences')
class CompanyPreferencesTable extends Table {
  TextColumn get id => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get companyId => text().references(
    AppUsers,
    #id,
    onDelete: KeyAction.cascade,
    onUpdate: KeyAction.cascade,
  )();
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
