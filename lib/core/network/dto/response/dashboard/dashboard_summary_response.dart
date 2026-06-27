import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabakat/core/network/dto/response/dashboard/customer_overview_response.dart';
import 'package:shabakat/core/network/dto/response/dashboard/expenses_by_type_response.dart';
import 'package:shabakat/core/network/dto/response/dashboard/invoice_overview_response.dart';

part 'dashboard_summary_response.freezed.dart';
part 'dashboard_summary_response.g.dart';

@freezed
sealed class DashboardSummaryResponse with _$DashboardSummaryResponse {
  const factory DashboardSummaryResponse({
    @Default(0.0) double totalBilledThisMonth,
    @Default(0.0) double totalCollectedThisMonth,
    @Default(0.0) double totalOutstandingAllTime,
    @Default(0.0) double collectionRate,
    @Default(0.0) double totalExpensesThisMonth,
    @Default(0.0) double netIncomeThisMonth,
    @Default(CustomerOverviewResponse()) CustomerOverviewResponse customers,
    @Default(InvoiceOverviewResponse()) InvoiceOverviewResponse invoices,
    @Default(ExpensesByTypeResponse()) ExpensesByTypeResponse expensesByType,
  }) = _DashboardSummaryResponse;

  factory DashboardSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$DashboardSummaryResponseFromJson(json);
}
