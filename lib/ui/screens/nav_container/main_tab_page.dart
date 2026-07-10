import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/api_errors.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/themes/app_colors.dart';
import 'package:shabakat/data/providers/network/internet_connection_provider.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';
import 'app_drawer.dart';
import 'bottom_nav_container.dart';
import '../dashboard/dashboard_screen.dart';
import '../subscribers/subscribers_screen.dart';
import '../invoices/invoices_screen.dart';
import '../invoices/widgets/bulk_create/bulk_create_action.dart';
import '../expenses/expenses_screen.dart';
import '../expenses/subscreens/expense_adding_screen.dart';
import '../audit/audit_screen.dart';
import '../areas/areas_page.dart';
import '../areas/subscreens/area_adding_screen.dart';
import '../distribution_box/distribution_box_screen.dart';
import '../distribution_box/subscreens/distribution_box_adding_screen.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';
import '../subscribers/subscreens/subscriber_adding_screen.dart';

class MainTabPage extends ConsumerStatefulWidget {
  const MainTabPage({super.key});

  @override
  ConsumerState<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends ConsumerState<MainTabPage> {
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    ref.listen(internetConnectionProvider, (previous, next) {
      if (previous == null || previous == next) return;

      if (next) {
        AppSnackBar.show(
          context,
          message: 'common.back_online'.tr(),
          variant: AppSnackBarVariant.success,
        );
      } else {
        AppSnackBar.show(
          context,
          message: ApiErrors.noInternet,
          variant: AppSnackBarVariant.error,
        );
      }
    });

    return Scaffold(
      appBar: _buildAppBar(theme, colorScheme),
      drawer: const AppDrawer(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() => _currentIndex = index),
        children: [
          DashboardScreen(onViewInvoices: () => _onTabChanged(2)),
          const SubscribersScreen(),
          const InvoicesScreen(),
          const ExpensesScreen(),
          const AreasPage(),
          const DistributionBoxScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavContainer(
        currentIndex: _currentIndex,
        onTabChanged: _onTabChanged,
      ),
    );
  }

  AppBar? _buildAppBar(ThemeData theme, ColorScheme colorScheme) {
    switch (_currentIndex) {
      case 0:
        return AppBar(
          title: Text(
            'tabs.dashboard'.tr(),
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSecondary,
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(LucideIcons.search)),
            IconButton(
              onPressed: _onOpenAudit,
              icon: Stack(
                children: [
                  const Icon(LucideIcons.bell),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: AppColors.error,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 8,
                        minHeight: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: context.paddingSmall),
          ],
        );
      case 1:
        return AppBar(
          title: Text(
            'tabs.subscribers'.tr(),
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSecondary,
            ),
          ),
          actions: [
            IconButton(
              onPressed: _onAddSubscriber,
              icon: const Icon(LucideIcons.plus),
            ),
            SizedBox(width: context.paddingSmall),
          ],
        );
      case 2:
        return AppBar(
          title: Text(
            'tabs.invoices'.tr(),
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSecondary,
            ),
          ),
          actions: const [BulkCreateInvoicesAction()],
        );
      case 3:
        return AppBar(
          title: Text(
            'tabs.expenses'.tr(),
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSecondary,
            ),
          ),
          actions: [
            IconButton(
              onPressed: _onAddExpense,
              icon: const Icon(LucideIcons.plus),
            ),
            SizedBox(width: context.paddingSmall),
          ],
        );
      case 4:
        return AppBar(
          title: Text(
            'tabs.areas'.tr(),
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSecondary,
            ),
          ),
          actions: [
            IconButton(
              onPressed: _onAddArea,
              icon: const Icon(LucideIcons.plus),
            ),
            SizedBox(width: context.paddingSmall),
          ],
        );
      case 5:
        return AppBar(
          title: Text(
            'tabs.distribution_boxes'.tr(),
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSecondary,
            ),
          ),
          actions: [
            IconButton(
              onPressed: _onAddDistributionBox,
              icon: const Icon(LucideIcons.plus),
            ),
            SizedBox(width: context.paddingSmall),
          ],
        );
      default:
        return null;
    }
  }

  void _onOpenAudit() {
    Navigator.of(context).push(openInnerScreen(widget: const AuditScreen()));
  }

  void _onAddSubscriber() {
    Navigator.of(
      context,
    ).push(openInnerScreen(widget: const SubscriberAddingScreen()));
  }

  void _onAddExpense() {
    Navigator.of(
      context,
    ).push(openInnerScreen(widget: const ExpenseAddingScreen()));
  }

  void _onAddArea() {
    Navigator.of(
      context,
    ).push(openInnerScreen(widget: const AreaAddingScreen()));
  }

  void _onAddDistributionBox() {
    Navigator.of(context).push(
      openInnerScreen(widget: const DistributionBoxAddingScreen()),
    );
  }
}
