enum PaymentMethod {
  cash('Cash'),
  wish('Wish');

  final String label;

  const PaymentMethod(this.label);

  static PaymentMethod fromName(String name) {
    return PaymentMethod.values.firstWhere(
      (e) => e.name == name.toLowerCase(),
      orElse: () => PaymentMethod.cash,
    );
  }
}
