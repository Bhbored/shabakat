enum CustomerStatus {
  active(1, 'Active'),
  suspended(2, 'Suspended'),
  terminated(3, 'Terminated');

  final int value;
  final String label;

  const CustomerStatus(this.value, this.label);

  static CustomerStatus fromValue(int value) {
    return CustomerStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => CustomerStatus.active,
    );
  }
}
