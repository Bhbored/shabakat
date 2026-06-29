import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
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
      padding: EdgeInsets.only(bottom: context.keyboardBottomInset),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          top: BorderSide(color: theme.colorScheme.outline),
        ),
      ),
      child: Row(
        children: [
            BottomNavItem(
              icon: LucideIcons.layoutDashboard,
              label: 'tabs.dashboard'.tr(),
              isActive: currentIndex == 0,
              onTap: () => onTabChanged(0),
            ),
            BottomNavItem(
              icon: LucideIcons.users,
              label: 'tabs.subscribers'.tr(),
              isActive: currentIndex == 1,
              onTap: () => onTabChanged(1),
            ),
            BottomNavItem(
              icon: LucideIcons.fileText,
              label: 'tabs.invoices'.tr(),
              isActive: currentIndex == 2,
              onTap: () => onTabChanged(2),
            ),
            BottomNavItem(
              icon: LucideIcons.wallet,
              label: 'tabs.expenses'.tr(),
              isActive: currentIndex == 3,
              onTap: () => onTabChanged(3),
            ),
            BottomNavItem(
              icon: LucideIcons.mapPin,
              label: 'tabs.areas'.tr(),
              isActive: currentIndex == 4,
              onTap: () => onTabChanged(4),
          ),
        ],
      ),
    );
  }
}
