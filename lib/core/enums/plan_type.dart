enum PlanType { ampere, kilowatt, fixedKilowatt }

extension PlanTypeX on PlanType {
  String get label => switch (this) {
    PlanType.ampere => 'Ampere',
    PlanType.kilowatt => 'Kilowatt',
    PlanType.fixedKilowatt => 'Fixed Kilowatt',
  };
}

extension StringToPlanType on String {
  PlanType toPlanType() => switch (toLowerCase()) {
    'kilowatt' => PlanType.kilowatt,
    'fixedkilowatt' => PlanType.fixedKilowatt,
    _ => PlanType.ampere,
  };
}
