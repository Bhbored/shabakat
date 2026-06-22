import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(alwaysCreate: true)
enum ExpenseType { fuel, maintenance, employees, other }

extension ExpenseTypeX on ExpenseType {
  String get label => switch (this) {
    ExpenseType.fuel => 'Fuel',
    ExpenseType.maintenance => 'Maintenance',
    ExpenseType.employees => 'Employees',
    ExpenseType.other => 'Other',
  };
}

extension StringToExpenseType on String {
  ExpenseType toExpenseType() => switch (this) {
    'Fuel' || 'fuel' => ExpenseType.fuel,
    'Maintenance' || 'maintenance' => ExpenseType.maintenance,
    'Employees' || 'employees' => ExpenseType.employees,
    'Other' || 'other' => ExpenseType.other,
    _ => ExpenseType.other,
  };
}
