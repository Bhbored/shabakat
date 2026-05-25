import 'package:flutter/material.dart';

class SendRemindersButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const SendRemindersButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text('Send Reminders'),
      ),
    );
  }
}
