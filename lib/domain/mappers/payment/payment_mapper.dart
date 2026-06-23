import 'package:shabakat/core/enums/payment_method.dart';
import 'package:shabakat/core/network/dto/response/payment/payment_response.dart';
import 'package:shabakat/domain/entities/payments/payment.dart';

extension PaymentResponseMapper on PaymentResponse {
  Payment toEntity() => Payment(
    id: id,
    createdAt: createdAt,
    updatedAt: createdAt,
    companyId: '',
    customerId: customerId,
    invoiceId: invoiceId,
    amount: amount,
    paymentMethod: toPaymentMethod(paymentMethod),
    paymentDate: paymentDate,
    notes: notes,
  );
}

PaymentMethod toPaymentMethod(String value) => switch (value.toLowerCase()) {
  'cash' => PaymentMethod.cash,
  'wish' => PaymentMethod.wish,
  _ => PaymentMethod.wish,
};
