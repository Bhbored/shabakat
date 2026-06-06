import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/domain/entities/invoices/invoice.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

@freezed
sealed class Customer with _$Customer {
  const factory Customer({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String companyId,
    required String name,
    String? phone,
    String? address,
    String? areaId,
    required CustomerType customerType,
    CustomerRelation? customerRelation,
    required DateTime subscriptionDate,
    double? priceOverride,
    double? fixedChargeOverride,
    double? tvaOverride,
    @Default(CustomerStatus.active) CustomerStatus customerStatus,
    required PlanType plan,
    required double planValue,
    List<Invoice>? invoices,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}
