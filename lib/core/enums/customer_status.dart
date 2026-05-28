enum CustomerStatus { active, suspended, terminated }

extension CustomerStatusX on CustomerStatus {
  String get label => switch (this) {
    CustomerStatus.active => 'Active',
    CustomerStatus.suspended => 'Suspended',
    CustomerStatus.terminated => 'Terminated',
  };
}
