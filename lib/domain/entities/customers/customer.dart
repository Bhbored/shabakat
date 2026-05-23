import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabakat/core/enums/enums.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

@freezed
sealed class Customer with _$Customer {
  const factory Customer({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
    @Default(false) bool isDeleted,
    required String companyId,
    required String name,
    String? phone,
    String? address,
    required String customerType,
    required DateTime subscriptionDate,
    @Default(CustomerStatus.active) CustomerStatus customerStatus,
    required PlanType plan,
    required double planValue,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}
