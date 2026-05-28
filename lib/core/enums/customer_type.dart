enum CustomerType {
  residential,
  commercial,
  industrial;
}

extension CustomerTypeX on CustomerType {
  String get label => switch (this) {
    CustomerType.residential => 'Residential',
    CustomerType.commercial => 'Commercial',
    CustomerType.industrial => 'Industrial',
  };
}
