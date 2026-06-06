import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_payment_request.freezed.dart';
part 'add_payment_request.g.dart';

@freezed
sealed class AddPaymentRequest with _$AddPaymentRequest {
  const factory AddPaymentRequest({
    required double amount,
    required String paymentMethod,
    String? notes,
  }) = _AddPaymentRequest;

  factory AddPaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$AddPaymentRequestFromJson(json);
}
