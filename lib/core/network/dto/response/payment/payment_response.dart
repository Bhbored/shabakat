import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_response.freezed.dart';
part 'payment_response.g.dart';

@freezed
sealed class PaymentResponse with _$PaymentResponse {
  const factory PaymentResponse({
    required String id,
    required String invoiceId,
    required String customerName,
    required String customerId,
    required double amount,
    required String paymentMethod,
    required DateTime paymentDate,
    String? notes,
    required DateTime createdAt,
  }) = _PaymentResponse;

  factory PaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseFromJson(json);
}
