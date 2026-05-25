import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'bottom_nav_item.dart';

class BottomNavContainer extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabChanged;

  const BottomNavContainer({
    super.key,
    required this.currentIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          top: BorderSide(color: theme.colorScheme.outline),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            BottomNavItem(
              icon: LucideIcons.layoutDashboard,
              label: 'Dashboard',
              isActive: currentIndex == 0,
              onTap: () => onTabChanged(0),
            ),
            BottomNavItem(
              icon: LucideIcons.users,
              label: 'Subscribers',
              isActive: currentIndex == 1,
              onTap: () => onTabChanged(1),
            ),
            BottomNavItem(
              icon: LucideIcons.fileText,
              label: 'Invoices',
              isActive: currentIndex == 2,
              onTap: () => onTabChanged(2),
            ),
            BottomNavItem(
              icon: LucideIcons.bell,
              label: 'Alerts',
              isActive: currentIndex == 3,
              onTap: () => onTabChanged(3),
            ),
          ],
        ),
      ),
    );
  }
}
