import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/network/dto/response/dashboard/dashboard_summary_response.dart';
import 'package:shabakat/core/themes/app_colors.dart';

import 'legend_item.dart';

const _months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

class RevenueChart extends StatelessWidget {
  final DashboardSummaryResponse summary;

  const RevenueChart({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final billed = summary.totalBilledThisMonth;
    final collected = summary.totalCollectedThisMonth;
    final peak = billed > collected ? billed : collected;
    final chartMax = peak <= 0 ? 1.0 : peak * 1.15;
    final interval = _niceInterval(chartMax);
    final now = DateTime.now();
    final monthLabel = _months[now.month - 1];
    final periodLabel = now.day > 1
        ? '$monthLabel 1 – $monthLabel ${now.day}'
        : '$monthLabel ${now.year}';

    return Card(
      child: Padding(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Revenue Overview',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      periodLabel,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    LegendItem(color: colorScheme.primary, label: 'Billed'),
                    SizedBox(width: context.paddingSmall),
                    LegendItem(color: AppColors.success, label: 'Collected'),
                  ],
                ),
              ],
            ),
            SizedBox(height: context.spaceMedium),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: 1,
                  minY: 0,
                  maxY: chartMax,
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: interval,
                    getDrawingHorizontalLine: (_) => FlLine(
                      color: colorScheme.outline.withValues(alpha: 0.3),
                      strokeWidth: 1,
                      dashArray: const [3, 3],
                    ),
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 44,
                        interval: interval,
                        getTitlesWidget: (value, _) {
                          if (value > chartMax || value < 0) {
                            return const SizedBox.shrink();
                          }
                          return Text(
                            _formatAxis(value),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.5,
                              ),
                              fontSize: 10,
                            ),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: (value, _) {
                          if (value != value.roundToDouble()) {
                            return const SizedBox.shrink();
                          }
                          return switch (value.toInt()) {
                            0 => Text(
                              'Start',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurface.withValues(
                                  alpha: 0.5,
                                ),
                                fontSize: 11,
                              ),
                            ),
                            1 => Text(
                              'Today',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurface.withValues(
                                  alpha: 0.5,
                                ),
                                fontSize: 11,
                              ),
                            ),
                            _ => const SizedBox.shrink(),
                          };
                        },
                      ),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipColor: (_) => colorScheme.surface,
                      tooltipBorder: BorderSide(color: colorScheme.outline),
                      getTooltipItems: (touchedSpots) {
                        return touchedSpots.map((spot) {
                          final isBilled = spot.barIndex == 0;
                          return LineTooltipItem(
                            '\$${spot.y.toStringAsFixed(2)}',
                            theme.textTheme.bodySmall!.copyWith(
                              color: isBilled
                                  ? colorScheme.primary
                                  : AppColors.success,
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ),
                  lineBarsData: [
                    _areaLine(
                      values: [0, billed],
                      color: colorScheme.primary,
                      gradientColor: colorScheme.primary,
                    ),
                    _areaLine(
                      values: [0, collected],
                      color: AppColors.success,
                      gradientColor: AppColors.success,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: context.spaceMedium),
            const Divider(),
            SizedBox(height: context.spaceMedium),
            _NetIncomeBanner(
              netIncome: summary.netIncomeThisMonth,
              expenses: summary.totalExpensesThisMonth,
            ),
          ],
        ),
      ),
    );
  }

  LineChartBarData _areaLine({
    required List<double> values,
    required Color color,
    required Color gradientColor,
  }) {
    return LineChartBarData(
      spots: values
          .asMap()
          .entries
          .map((e) => FlSpot(e.key.toDouble(), e.value))
          .toList(),
      isCurved: true,
      curveSmoothness: 0.35,
      barWidth: 2,
      color: color,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            gradientColor.withValues(alpha: 0.2),
            gradientColor.withValues(alpha: 0.0),
          ],
        ),
      ),
    );
  }
}

double _niceInterval(double maxY) {
  if (maxY <= 100) return 20;
  if (maxY <= 500) return 100;
  if (maxY <= 2000) return 500;
  if (maxY <= 10000) return 2000;
  return (maxY / 4).ceilToDouble();
}

String _formatAxis(double value) {
  if (value >= 1000) return '\$${(value / 1000).toStringAsFixed(0)}k';
  return '\$${value.toStringAsFixed(0)}';
}

String _formatMoney(double value) => '\$${value.toStringAsFixed(2)}';

class _NetIncomeBanner extends StatelessWidget {
  final double netIncome;
  final double expenses;

  const _NetIncomeBanner({
    required this.netIncome,
    required this.expenses,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isPositive = netIncome >= 0;
    final accent = isPositive ? AppColors.success : AppColors.error;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.paddingMedium),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(context.borderRadiusMedium),
        border: Border.all(color: accent.withValues(alpha: 0.22)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(context.paddingSmall),
            decoration: BoxDecoration(
              color: accent.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(context.borderRadiusMedium),
            ),
            child: Icon(
              isPositive ? LucideIcons.trendingUp : LucideIcons.trendingDown,
              size: 20,
              color: accent,
            ),
          ),
          SizedBox(width: context.paddingSmall),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NET INCOME THIS MONTH',
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.0,
                    color: colorScheme.onSurface.withValues(alpha: 0.55),
                  ),
                ),
                SizedBox(height: context.spaceSmall * 0.25),
                Text(
                  _formatMoney(netIncome),
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontFamily: 'JetBrains Mono',
                    color: accent,
                  ),
                ),
                Text(
                  'After ${_formatMoney(expenses)} in expenses',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
