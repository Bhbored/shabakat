enum PlanType {
  ampere('Ampere'),
  kilowatt('Kilowatt');

  final String label;

  const PlanType(this.label);

  static PlanType fromName(String name) {
    return PlanType.values.firstWhere(
      (e) => e.name == name.toLowerCase(),
      orElse: () => PlanType.ampere,
    );
  }
}
