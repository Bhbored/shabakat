import 'package:flutter/material.dart';

class DashboardAvatar extends StatelessWidget {
  final String name;
  final double size;

  const DashboardAvatar({
    super.key,
    required this.name,
    this.size = 36,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final initials = name.split(' ').map((n) => n[0]).take(2).join('').toUpperCase();
    
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: TextStyle(
          color: colorScheme.primary,
          fontSize: size * 0.33,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
