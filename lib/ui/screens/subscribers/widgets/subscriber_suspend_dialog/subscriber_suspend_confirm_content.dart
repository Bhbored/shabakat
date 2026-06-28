import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SubscriberSuspendConfirmContent extends StatelessWidget {
  final int count;

  const SubscriberSuspendConfirmContent({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final noun = count == 1
        ? 'subscribers.suspend.noun_one'.tr()
        : 'subscribers.suspend.noun_many'.tr();

    return Text(
      'subscribers.suspend.message'.tr(args: [count.toString(), noun]),
      style: theme.textTheme.bodyMedium,
    );
  }
}
