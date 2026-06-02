enum PlanType { ampere, kilowatt }

extension PlanTypeX on PlanType {
  String get label => switch (this) {
    PlanType.ampere => 'Ampere',
    PlanType.kilowatt => 'Kilowatt',
  };
}

extension StringToPlanType on String {
  PlanType toPlanType() => switch (toLowerCase()) {
    'kilowatt' => PlanType.kilowatt,
    _ => PlanType.ampere,
  };
}
