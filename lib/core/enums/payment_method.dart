enum PaymentMethod { cash, wish }

extension PaymentMethodX on PaymentMethod {
  String get label => switch (this) {
    PaymentMethod.cash => 'Cash',
    PaymentMethod.wish => 'Wish',
  };
}
