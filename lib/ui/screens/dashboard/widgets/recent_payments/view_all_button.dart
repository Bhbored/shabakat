import 'package:flutter/material.dart';

class ViewAllButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const ViewAllButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text('View all →', style: Theme.of(context).textTheme.labelMedium),
    );
  }
}
