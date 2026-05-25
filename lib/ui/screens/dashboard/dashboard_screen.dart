import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'widgets/stat_grid/stat_grid.dart';
import 'widgets/revenue_chart/revenue_chart.dart';
import 'widgets/recent_payments/recent_payments_list.dart';
import 'widgets/upcoming_due/upcoming_due_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colors.onSecondary,
              ),
            ),
            Text(
              'El-Nour Generators · May 2025',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: colors.onSecondary,
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
                      color: Colors.red,
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
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StatGrid(),
            SizedBox(height: context.spaceMedium),
            const RevenueChart(),
            SizedBox(height: context.spaceMedium),
            const RecentPaymentsList(),
            SizedBox(height: context.spaceMedium),
            const UpcomingDueList(),
            SizedBox(height: context.scrollPaddingAboveMainNav),
          ],
        ),
      ),
    );
  }
}
