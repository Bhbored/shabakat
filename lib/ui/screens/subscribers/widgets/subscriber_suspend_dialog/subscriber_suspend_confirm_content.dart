import 'package:flutter/material.dart';

class SubscriberSuspendConfirmContent extends StatelessWidget {
  final int count;

  const SubscriberSuspendConfirmContent({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final noun = count == 1 ? 'subscriber' : 'subscribers';

    return Text(
      'Are you sure you want to suspend $count $noun? '
      'Suspended subscribers will not receive service until they are reactivated.',
      style: theme.textTheme.bodyMedium,
    );
  }
}
