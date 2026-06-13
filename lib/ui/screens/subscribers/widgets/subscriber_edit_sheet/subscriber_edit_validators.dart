class SubscriberEditValidators {
  SubscriberEditValidators._();

  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) return 'Enter subscriber name';
    if (value.trim().length > 200) return 'Max 200 characters';
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) return 'Enter phone number';
    if (value.trim().length > 30) return 'Max 30 characters';
    return null;
  }

  static String? address(String? value) {
    if (value == null || value.trim().isEmpty) return 'Enter address';
    if (value.trim().length > 500) return 'Max 500 characters';
    return null;
  }

  static String? planValue(String? value) {
    if (value == null || value.trim().isEmpty) return 'Enter plan value';
    final parsed = int.tryParse(value.trim());
    if (parsed == null) return 'Enter a valid number';
    if (parsed < 1 || parsed > 100) return 'Must be between 1 and 100';
    return null;
  }
}
