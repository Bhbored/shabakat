// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardSummaryResponse _$DashboardSummaryResponseFromJson(
  Map<String, dynamic> json,
) => _DashboardSummaryResponse(
  totalBilledAllTime: (json['totalBilledAllTime'] as num?)?.toDouble() ?? 0.0,
  totalCollectedAllTime:
      (json['totalCollectedAllTime'] as num?)?.toDouble() ?? 0.0,
  totalOutstandingAllTime:
      (json['totalOutstandingAllTime'] as num?)?.toDouble() ?? 0.0,
  collectionRate: (json['collectionRate'] as num?)?.toDouble() ?? 0.0,
  totalExpensesAllTime:
      (json['totalExpensesAllTime'] as num?)?.toDouble() ?? 0.0,
  netIncomeAllTime: (json['netIncomeAllTime'] as num?)?.toDouble() ?? 0.0,
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
  'totalBilledAllTime': instance.totalBilledAllTime,
  'totalCollectedAllTime': instance.totalCollectedAllTime,
  'totalOutstandingAllTime': instance.totalOutstandingAllTime,
  'collectionRate': instance.collectionRate,
  'totalExpensesAllTime': instance.totalExpensesAllTime,
  'netIncomeAllTime': instance.netIncomeAllTime,
  'customers': instance.customers,
  'invoices': instance.invoices,
  'expensesByType': instance.expensesByType,
};
