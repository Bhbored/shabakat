// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardSummaryResponse _$DashboardSummaryResponseFromJson(
  Map<String, dynamic> json,
) => _DashboardSummaryResponse(
  totalBilledThisMonth:
      (json['totalBilledThisMonth'] as num?)?.toDouble() ?? 0.0,
  totalCollectedThisMonth:
      (json['totalCollectedThisMonth'] as num?)?.toDouble() ?? 0.0,
  totalOutstandingAllTime:
      (json['totalOutstandingAllTime'] as num?)?.toDouble() ?? 0.0,
  collectionRate: (json['collectionRate'] as num?)?.toDouble() ?? 0.0,
  totalExpensesThisMonth:
      (json['totalExpensesThisMonth'] as num?)?.toDouble() ?? 0.0,
  netIncomeThisMonth: (json['netIncomeThisMonth'] as num?)?.toDouble() ?? 0.0,
  customers: json['customers'] == null
      ? const CustomerOverviewResponse()
      : CustomerOverviewResponse.fromJson(
          json['customers'] as Map<String, dynamic>,
        ),
  invoices: json['invoices'] == null
      ? const InvoiceOverviewResponse()
      : InvoiceOverviewResponse.fromJson(
          json['invoices'] as Map<String, dynamic>,
        ),
  expensesByType: json['expensesByType'] == null
      ? const ExpensesByTypeResponse()
      : ExpensesByTypeResponse.fromJson(
          json['expensesByType'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$DashboardSummaryResponseToJson(
  _DashboardSummaryResponse instance,
) => <String, dynamic>{
  'totalBilledThisMonth': instance.totalBilledThisMonth,
  'totalCollectedThisMonth': instance.totalCollectedThisMonth,
  'totalOutstandingAllTime': instance.totalOutstandingAllTime,
  'collectionRate': instance.collectionRate,
  'totalExpensesThisMonth': instance.totalExpensesThisMonth,
  'netIncomeThisMonth': instance.netIncomeThisMonth,
  'customers': instance.customers,
  'invoices': instance.invoices,
  'expensesByType': instance.expensesByType,
};
