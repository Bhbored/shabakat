import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabakat/core/enums/enums.dart';

part 'create_invoice_request.freezed.dart';
part 'create_invoice_request.g.dart';

@freezed
sealed class CreateInvoiceRequest with _$CreateInvoiceRequest {
  const factory CreateInvoiceRequest({
    required String customerId,
    double? paymentAmount,
    double? kilowattAmount,
    PaymentMethod? paymentMethod,
    String? notes,
  }) = _CreateInvoiceRequest;

  factory CreateInvoiceRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateInvoiceRequestFromJson(json);
}
