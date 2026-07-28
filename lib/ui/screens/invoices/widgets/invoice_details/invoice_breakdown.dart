import 'package:shabakat/domain/entities/invoices/invoice.dart';

class InvoiceBreakdown {
  final double charge;
  final double fixedCharge;
  final double tvaRate;
  final double tvaAmount;
  final double planValue;

  const InvoiceBreakdown({
    required this.charge,
    required this.fixedCharge,
    required this.tvaRate,
    required this.tvaAmount,
    required this.planValue,
  });

  double get displayedCharge => charge + planValue;

  factory InvoiceBreakdown.fromInvoice(
    Invoice invoice, {
    double planValue = 0,
    bool includePlanValue = false,
  }) {
    final fixedCharge = invoice.fixedCharge;
    final tvaRate = invoice.tva;
    final addedPlanValue = includePlanValue ? planValue : 0.0;
    final taxableTotal = invoice.totalAmount - addedPlanValue;

    if (tvaRate <= 0) {
      return InvoiceBreakdown(
        charge: taxableTotal - fixedCharge,
        fixedCharge: fixedCharge,
        tvaRate: tvaRate,
        tvaAmount: 0,
        planValue: addedPlanValue,
      );
    }

    final rate = tvaRate / 100;
    final subtotal = taxableTotal / (1 + rate);
    final charge = subtotal - fixedCharge;
    final tvaAmount = subtotal * rate;

    return InvoiceBreakdown(
      charge: charge,
      fixedCharge: fixedCharge,
      tvaRate: tvaRate,
      tvaAmount: tvaAmount,
      planValue: addedPlanValue,
    );
  }
}
