import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/storage/shared_preferences/shared_preferences.dart';
import 'package:shabakat/ui/offline_mode/areas/areas_offline_page.dart';
import 'package:shabakat/ui/offline_mode/customers/customers_offline_page.dart';
import 'package:shabakat/ui/offline_mode/distribution_box/distribution_box_offline_page.dart';
import 'package:shabakat/ui/offline_mode/expenses/expenses_offline_page.dart';
import 'package:shabakat/ui/offline_mode/invoices/invoices_offline_page.dart';
import 'package:shabakat/ui/offline_mode/shared/offline_bottom_nav_container.dart';
import 'package:shabakat/ui/screens/nav_container/main_tab_page.dart';

class OfflineNavigationContainer extends ConsumerStatefulWidget {
  const OfflineNavigationContainer({super.key});

  @override
  ConsumerState<OfflineNavigationContainer> createState() =>
      _OfflineNavigationContainerState();
}

class _OfflineNavigationContainerState
    extends ConsumerState<OfflineNavigationContainer> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabChanged(int index) {
    setState(() => _currentIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _exitOfflineMode() async {
    await ref.read(sharedPreferencesHandlerProvider).setOfflineMode(false);
    if (!mounted) return;
    await Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const MainTabPage()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return PopScope(
      canPop: false,
      child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          _titleForIndex(_currentIndex),
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSecondary,
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: _exitOfflineMode,
            icon: const Icon(LucideIcons.wifi, size: 18),
            label: Text('common.offline_mode.go_online'.tr()),
          ),
          SizedBox(width: context.paddingSmall),
        ],
      ),
      body: Column(
        children: [
          Material(
            color: colorScheme.secondaryContainer,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.paddingMedium,
                vertical: context.spaceSmall,
              ),
              child: Row(
                children: [
                  Icon(
                    LucideIcons.cloudOff,
                    size: 16,
                    color: colorScheme.onSecondaryContainer,
                  ),
                  SizedBox(width: context.spaceSmall),
                  Expanded(
                    child: Text(
                      'common.offline_mode.banner'.tr(),
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              children: const [
                CustomersOfflinePage(),
                InvoicesOfflinePage(),
                ExpensesOfflinePage(),
                AreasOfflinePage(),
                DistributionBoxOfflinePage(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: OfflineBottomNavContainer(
        currentIndex: _currentIndex,
        onTabChanged: _onTabChanged,
      ),
    ),
    );
  }

  String _titleForIndex(int index) => switch (index) {
    0 => 'tabs.subscribers'.tr(),
    1 => 'tabs.invoices'.tr(),
    2 => 'tabs.expenses'.tr(),
    3 => 'tabs.areas'.tr(),
    4 => 'tabs.distribution_boxes'.tr(),
    _ => 'common.offline_mode.title'.tr(),
  };
}
