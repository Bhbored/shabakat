import 'package:drift/drift.dart' show Value;
import 'package:shabakat/core/enums/payment_method.dart';
import 'package:shabakat/core/network/dto/response/payment/payment_response.dart';
import 'package:shabakat/domain/entities/payments/payment.dart';
import 'package:shabakat/infrastructor/db/database.dart' as drift;

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

extension PaymentEntityMapper on Payment {
  drift.PaymentsCompanion toCompanion() => drift.PaymentsCompanion(
    id: Value(id),
    createdAt: Value(createdAt),
    updatedAt: Value(updatedAt),
    customerId: Value(customerId),
    invoiceId: Value(invoiceId),
    amount: Value(amount),
    paymentMethod: Value(paymentMethod.name),
    paymentDate: Value(paymentDate),
    notes: Value(notes),
  );
}

extension PaymentDriftMapper on drift.Payment {
  Payment toEntity() => Payment(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    companyId: '',
    customerId: customerId,
    invoiceId: invoiceId,
    amount: amount,
    paymentMethod: toPaymentMethod(paymentMethod),
    paymentDate: paymentDate,
    notes: notes,
  );
}
