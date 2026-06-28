import 'package:shabakat/core/enums/invoice_status.dart';
import 'package:shabakat/core/network/dto/response/invoice/invoice_response.dart';
import 'package:shabakat/core/network/dto/response/invoice/invoice_summary_response.dart';
import 'package:shabakat/domain/entities/invoices/invoice.dart';
import 'package:shabakat/domain/mappers/payment/payment_mapper.dart';

extension InvoiceResponseMapper on InvoiceResponse {
  Invoice toEntity() => Invoice(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    companyId: '',
    customerId: '',
    invoiceNumber: invoiceNumber,
    customerName: customerName,
    issueDate: issueDate,
    dueDate: dueDate,
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

extension InvoiceSummaryResponseMapper on InvoiceSummaryResponse {
  Invoice toEntity() => Invoice(
    id: id,
    createdAt: createdAt,
    updatedAt: createdAt,
    companyId: '',
    customerId: '',
    customerName: customerName,
    invoiceNumber: invoiceNumber,
    issueDate: issueDate,
    dueDate: dueDate,
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
