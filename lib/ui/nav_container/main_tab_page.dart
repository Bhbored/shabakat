import 'package:flutter/material.dart';
import 'bottom_nav_container.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/subscribers/subscribers_screen.dart';

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
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() => _currentIndex = index),
        children: const [
          DashboardScreen(),
          SubscribersScreen(),
          Center(child: Text('Invoices')),
          Center(child: Text('Notifications')),
        ],
      ),
      bottomNavigationBar: BottomNavContainer(
        currentIndex: _currentIndex,
        onTabChanged: _onTabChanged,
      ),
    );
  }
}
