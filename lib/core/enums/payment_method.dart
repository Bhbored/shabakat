import 'package:easy_localization/easy_localization.dart';

enum PaymentMethod { cash, wish }

extension PaymentMethodX on PaymentMethod {
  String get label => switch (this) {
    PaymentMethod.cash => 'subscribers.payment_method.cash'.tr(),
    PaymentMethod.wish => 'subscribers.payment_method.wish'.tr(),
  };
}
