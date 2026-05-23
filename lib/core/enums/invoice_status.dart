enum InvoiceStatus {
  unpaid('Unpaid'),
  partiallypaid('Partially Paid'),
  paid('Paid');

  final String label;

  const InvoiceStatus(this.label);

  static InvoiceStatus fromName(String name) {
    return InvoiceStatus.values.firstWhere(
      (e) => e.name == name.toLowerCase(),
      orElse: () => InvoiceStatus.unpaid,
    );
  }
}
