import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/themes/app_colors.dart';
import 'app_drawer.dart';
import 'bottom_nav_container.dart';
import '../dashboard/dashboard_screen.dart';
import '../subscribers/subscribers_screen.dart';
import '../invoices/invoices_screen.dart';
import '../areas/areas_page.dart';
import '../areas/subscreens/area_adding_screen.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';
import '../subscribers/subscreens/subscriber_adding_screen.dart';

class MainTabPage extends StatefulWidget {
  const MainTabPage({super.key});

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {
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

    return Scaffold(
      appBar: _buildAppBar(theme, colorScheme),
      drawer: const AppDrawer(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() => _currentIndex = index),
        children: [
          DashboardScreen(
            onViewAllPayments: () => _onTabChanged(1),
            onSendReminders: () => _onTabChanged(3),
          ),
          const SubscribersScreen(),
          const InvoicesScreen(),
          const AreasPage(),
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
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dashboard',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSecondary,
                ),
              ),
              Text(
                'El-Nour Generators · May 2025',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSecondary,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(LucideIcons.search)),
            IconButton(
              onPressed: () {},
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
            'Subscribers',
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
            'Invoices',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSecondary,
            ),
          ),
        );
      case 3:
        return AppBar(
          title: Text(
            'Areas',
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
      default:
        return null;
    }
  }

  void _onAddSubscriber() {
    Navigator.of(context).push(
      openInnerScreen(widget: const SubscriberAddingScreen()),
    );
  }

  void _onAddArea() {
    Navigator.of(context).push(
      openInnerScreen(widget: const AreaAddingScreen()),
    );
  }
}
