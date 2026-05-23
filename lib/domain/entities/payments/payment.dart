import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabakat/core/enums/enums.dart';

part 'payment.freezed.dart';
part 'payment.g.dart';

@freezed
sealed class Payment with _$Payment {
  const factory Payment({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
    @Default(false) bool isDeleted,
    required String companyId,
    required String customerId,
    required String invoiceId,
    required double amount,
    required PaymentMethod paymentMethod,
    required DateTime paymentDate,
    String? notes,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}
