import 'package:drift/drift.dart' show Value;
import 'package:shabakat/core/enums/invoice_status.dart';
import 'package:shabakat/core/network/dto/response/invoice/invoice_response.dart';
import 'package:shabakat/core/network/dto/response/invoice/invoice_summary_response.dart';
import 'package:shabakat/domain/entities/invoices/invoice.dart';
import 'package:shabakat/domain/mappers/payment/payment_mapper.dart';
import 'package:shabakat/infrastructor/db/database.dart' as drift;

extension InvoiceResponseMapper on InvoiceResponse {
  Invoice toEntity() {
    final resolvedCustomerId = payments.isNotEmpty
        ? payments.first.customerId
        : '';

    return Invoice(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      companyId: '',
      customerId: resolvedCustomerId,
      invoiceNumber: invoiceNumber,
      customerName: customerName,
      issueDate: consumptionStart,
      dueDate: consumptionEnd,
      fixedCharge: fixedCharge,
      tva: tva,
      totalAmount: totalAmount,
      paidAmount: paidAmount,
      amountDue: amountDue,
      billedConsumption: billedConsumption,
      invoiceStatus: toInvoiceStatus(invoiceStatus),
      payments: payments.map((p) => p.toEntity()).toList(),
    );
  }
}

extension InvoiceSummaryResponseMapper on InvoiceSummaryResponse {
  Invoice toEntity() => Invoice(
    id: id,
    createdAt: createdAt,
    updatedAt: createdAt,
    companyId: '',
    customerId: '',
    customerName: customerName,
    invoiceNumber: invoiceNumber,
    issueDate: consumptionStart,
    dueDate: consumptionEnd,
    fixedCharge: 0,
    tva: 0,
    totalAmount: totalAmount,
    paidAmount: paidAmount,
    amountDue: amountDue,
    billedConsumption: billedConsumption,
    invoiceStatus: toInvoiceStatus(invoiceStatus),
  );
}

InvoiceStatus toInvoiceStatus(String value) => switch (value.toLowerCase()) {
  'paid' => InvoiceStatus.paid,
  'partiallypaid' => InvoiceStatus.partiallypaid,
  'unpaid' => InvoiceStatus.unpaid,
  _ => InvoiceStatus.unpaid,
};

extension InvoiceEntityMapper on Invoice {
  drift.InvoicesCompanion toCompanion() => drift.InvoicesCompanion(
    id: Value(id),
    createdAt: Value(createdAt),
    updatedAt: Value(updatedAt),
    customerId: Value(customerId),
    customerName: Value(customerName),
    invoiceNumber: Value(invoiceNumber),
    issueDate: Value(issueDate),
    dueDate: Value(dueDate),
    fixedCharge: Value(fixedCharge),
    tva: Value(tva),
    totalAmount: Value(totalAmount),
    paidAmount: Value(paidAmount),
    amountDue: Value(amountDue),
    billedConsumption: Value(billedConsumption),
    invoiceStatus: Value(invoiceStatus.name),
  );
}

extension InvoiceDriftMapper on drift.Invoice {
  Invoice toEntity() => Invoice(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    companyId: '',
    customerId: customerId,
    customerName: customerName,
    invoiceNumber: invoiceNumber,
    issueDate: issueDate,
    dueDate: dueDate,
    fixedCharge: fixedCharge,
    tva: tva,
    totalAmount: totalAmount,
    paidAmount: paidAmount,
    amountDue: amountDue,
    billedConsumption: billedConsumption,
    invoiceStatus: toInvoiceStatus(invoiceStatus),
  );
}
