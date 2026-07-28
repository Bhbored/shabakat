import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/enums/plan_type.dart';
import 'package:shabakat/core/network/dto/request/invoice/invoice_filter_request.dart';
import 'package:shabakat/core/network/services/invoice/invoice_service.dart';
import 'package:shabakat/data/providers/customer/single_customer_provider.dart';
import 'package:shabakat/data/providers/invoice/single_invoice_provider.dart';
import 'package:shabakat/data/providers/offline/offline_mode_provider.dart';
import 'package:shabakat/domain/entities/invoices/invoice.dart';
import 'package:shabakat/domain/mappers/invoice/invoice_mapper.dart';

import '../../repositories/repositories.dart';

part 'invoice_breakdown_params_provider.g.dart';

Duration? retry(int _, Object _) => null;

class InvoiceBreakdownParams {
  final PlanType plan;
  final double planValue;
  final bool includePlanValue;

  const InvoiceBreakdownParams({
    required this.plan,
    required this.planValue,
    required this.includePlanValue,
  });
}

@Riverpod(keepAlive: false, retry: retry)
Future<InvoiceBreakdownParams> invoiceBreakdownParams(
  Ref ref,
  String invoiceId,
) async {
  final invoice = await ref.watch(singleInvoiceProvider(invoiceId).future);

  if (invoice.customerId.isEmpty) {
    return const InvoiceBreakdownParams(
      plan: PlanType.ampere,
      planValue: 0,
      includePlanValue: false,
    );
  }

  final customer = await ref.watch(
    singleCustomerProvider(invoice.customerId).future,
  );

  final includePlanValue = switch (customer.plan) {
    PlanType.ampere => false,
    PlanType.kilowatt => true,
    PlanType.fixedKilowatt => await _isFirstInvoiceOfMonth(ref, invoice),
  };

  return InvoiceBreakdownParams(
    plan: customer.plan,
    planValue: customer.planValue,
    includePlanValue: includePlanValue,
  );
}

Future<bool> _isFirstInvoiceOfMonth(Ref ref, Invoice invoice) async {
  final start = invoice.issueDate;
  final from = DateTime(start.year, start.month, 1);
  final to = DateTime(start.year, start.month + 1, 0);
  final filter = InvoiceFilterRequest(
    customerId: invoice.customerId,
    consumptionStartFrom: from,
    consumptionStartTo: to,
    pageNumber: 1,
    pageSize: 100,
  );

  final isOfflineMode = await ref.watch(offlineModeProvider.future);
  final List<Invoice> siblings;
  if (isOfflineMode) {
    siblings = await ref
        .read(invoiceRepoProvider)
        .getAllInvoices(
          filter.customerId,
          filter.invoiceStatus,
          filter.consumptionStartFrom,
          filter.consumptionStartTo,
          pageNumber: filter.pageNumber,
          pageSize: filter.pageSize,
        );
  } else {
    final page = await ref.read(invoiceServiceProvider).getInvoices(filter);
    siblings = page.data.map((x) => x.toEntity()).toList();
  }

  final hasEarlier = siblings.any((sibling) {
    if (sibling.id == invoice.id) return false;
    if (sibling.issueDate.year != start.year ||
        sibling.issueDate.month != start.month) {
      return false;
    }
    if (sibling.invoiceNumber != invoice.invoiceNumber) {
      return sibling.invoiceNumber < invoice.invoiceNumber;
    }
    return sibling.createdAt.isBefore(invoice.createdAt);
  });

  return !hasEarlier;
}
