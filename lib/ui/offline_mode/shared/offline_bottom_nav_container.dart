import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/ui/screens/nav_container/bottom_nav_item.dart';

class OfflineBottomNavContainer extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabChanged;

  const OfflineBottomNavContainer({
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
        border: Border(top: BorderSide(color: theme.colorScheme.outline)),
      ),
      child: Row(
        children: [
          BottomNavItem(
            icon: LucideIcons.users,
            label: 'tabs.nav.subscribers'.tr(),
            isActive: currentIndex == 0,
            onTap: () => onTabChanged(0),
          ),
          BottomNavItem(
            icon: LucideIcons.fileText,
            label: 'tabs.nav.invoices'.tr(),
            isActive: currentIndex == 1,
            onTap: () => onTabChanged(1),
          ),
          BottomNavItem(
            icon: LucideIcons.wallet,
            label: 'tabs.nav.expenses'.tr(),
            isActive: currentIndex == 2,
            onTap: () => onTabChanged(2),
          ),
          BottomNavItem(
            icon: LucideIcons.mapPin,
            label: 'tabs.nav.areas'.tr(),
            isActive: currentIndex == 3,
            onTap: () => onTabChanged(3),
          ),
          BottomNavItem(
            icon: LucideIcons.box,
            label: 'tabs.nav.distribution_boxes'.tr(),
            isActive: currentIndex == 4,
            onTap: () => onTabChanged(4),
          ),
        ],
      ),
    );
  }
}
