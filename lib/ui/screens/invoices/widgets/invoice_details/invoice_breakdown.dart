import 'package:shabakat/domain/entities/invoices/invoice.dart';

class InvoiceBreakdown {
  final double charge;
  final double fixedCharge;
  final double tvaRate;
  final double tvaAmount;

  const InvoiceBreakdown({
    required this.charge,
    required this.fixedCharge,
    required this.tvaRate,
    required this.tvaAmount,
  });

  factory InvoiceBreakdown.fromInvoice(Invoice invoice) {
    final fixedCharge = invoice.fixedCharge;
    final tvaRate = invoice.tva;

    if (tvaRate <= 0) {
      return InvoiceBreakdown(
        charge: invoice.totalAmount - fixedCharge,
        fixedCharge: fixedCharge,
        tvaRate: tvaRate,
        tvaAmount: 0,
      );
    }

    final rate = tvaRate / 100;
    final subtotal = invoice.totalAmount / (1 + rate);
    final charge = subtotal - fixedCharge;
    final tvaAmount = subtotal * rate;

    return InvoiceBreakdown(
      charge: charge,
      fixedCharge: fixedCharge,
      tvaRate: tvaRate,
      tvaAmount: tvaAmount,
    );
  }
}
