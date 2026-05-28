enum InvoiceStatus { unpaid, partiallypaid, paid }

extension InvoiceStatusX on InvoiceStatus {
  String get label => switch (this) {
    InvoiceStatus.unpaid => 'Unpaid',
    InvoiceStatus.partiallypaid => 'Partially Paid',
    InvoiceStatus.paid => 'Paid',
  };
}
