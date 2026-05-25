import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/ui/data/app_data.dart';
import 'legend_item.dart';

class RevenueChart extends StatelessWidget {
  const RevenueChart({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

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
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Dec 2024 – May 2025',
                      style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurface.withValues(alpha: 0.6)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    LegendItem(color: colorScheme.primary, label: 'Billed'),
                    SizedBox(width: context.paddingSmall),
                    const LegendItem(color: Color(0xFF10B981), label: 'Collected'),
                  ],
                ),
              ],
            ),
            SizedBox(height: context.spaceMedium),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 2000,
                    getDrawingHorizontalLine: (_) => FlLine(
                      color: colorScheme.outline.withValues(alpha: 0.3),
                      strokeWidth: 1,
                      dashArray: [3, 3],
                    ),
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        interval: 2000,
                        getTitlesWidget: (value, _) {
                          return Text(
                            '\$${(value / 1000).toStringAsFixed(0)}k',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurface.withValues(alpha: 0.5),
                              fontSize: 10,
                            ),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, _) {
                          final index = value.toInt();
                          if (index < 0 || index >= revenueData.length) return const SizedBox.shrink();
                          return Text(
                            revenueData[index].month,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurface.withValues(alpha: 0.5),
                              fontSize: 11,
                            ),
                          );
                        },
                      ),
                    ),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
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
                            '\$${spot.y.toStringAsFixed(0)}',
                            theme.textTheme.bodySmall!.copyWith(
                              color: isBilled ? colorScheme.primary : const Color(0xFF10B981),
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ),
                  minY: 6000,
                  maxY: 14000,
                  lineBarsData: [
                    _areaLine(
                      data: revenueData.map((e) => e.billed).toList(),
                      color: colorScheme.primary,
                      gradientColor: colorScheme.primary,
                    ),
                    _areaLine(
                      data: revenueData.map((e) => e.collected).toList(),
                      color: const Color(0xFF10B981),
                      gradientColor: const Color(0xFF10B981),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  LineChartBarData _areaLine({
    required List<double> data,
    required Color color,
    required Color gradientColor,
  }) {
    return LineChartBarData(
      spots: data.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value)).toList(),
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
