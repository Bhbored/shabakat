import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/themes/app_colors.dart';
import 'package:shabakat/ui/data/app_data.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/common/dashboard_avatar.dart';
import 'package:shabakat/ui/widgets/status_badge.dart';
import 'widgets/subscriber_dropdown.dart';
import 'widgets/meta_item.dart';
import 'widgets/total_row.dart';

class InvoicesScreen extends StatefulWidget {
  const InvoicesScreen({super.key});

  @override
  State<InvoicesScreen> createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends State<InvoicesScreen> {
  int _selectedId = allSubscribers.first.id;

  Subscriber get _subscriber =>
      allSubscribers.firstWhere((s) => s.id == _selectedId);

  String get _invoiceNumber =>
      'INV-2025-${_selectedId.toString().padLeft(4, '0')}';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final s = _subscriber;

    return SingleChildScrollView(
      padding: EdgeInsets.all(context.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Subscriber',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                    SizedBox(height: context.spaceSmall * 0.5),
                    SubscriberDropdown(
                      selectedId: _selectedId,
                      onChanged: (id) => setState(() => _selectedId = id),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: context.spaceMedium),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _onPrint,
                  icon: const Icon(LucideIcons.printer, size: 18),
                  label: const Text('Print'),
                ),
              ),
              SizedBox(width: context.paddingSmall),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _onDownload,
                  icon: const Icon(LucideIcons.download, size: 18),
                  label: const Text('Download PDF'),
                ),
              ),
            ],
          ),
          SizedBox(height: context.spaceMedium),
          Card(
            child: Padding(
              padding: EdgeInsets.all(context.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(context.paddingSmall),
                              decoration: BoxDecoration(
                                color: colorScheme.primary,
                                borderRadius: BorderRadius.circular(
                                  context.borderRadiusMedium,
                                ),
                              ),
                              child: Icon(
                                LucideIcons.zap,
                                color: colorScheme.onPrimary,
                                size: 24,
                              ),
                            ),
                            SizedBox(width: context.paddingSmall),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'El-Nour Generators',
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'Hamra Street, Beirut, Lebanon',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurface.withValues(
                                        alpha: 0.6,
                                      ),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    '+961 71 000 000 · elnour@generators.lb',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurface.withValues(
                                        alpha: 0.6,
                                      ),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: context.paddingSmall),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'INVOICE',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontFamily: 'JetBrains Mono',
                              color: colorScheme.primary,
                            ),
                          ),
                          Text(
                            _invoiceNumber,
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontFamily: 'JetBrains Mono',
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.6,
                              ),
                            ),
                          ),
                          SizedBox(height: context.spaceSmall),
                          StatusBadge(status: s.status),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: context.spaceMedium),
                  Container(
                    padding: EdgeInsets.all(context.paddingMedium),
                    decoration: BoxDecoration(
                      color: colorScheme.secondary.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(
                        context.borderRadiusMedium,
                      ),
                      border: Border.all(color: colorScheme.outline),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: MetaItem(
                            label: 'Issue Date',
                            value: 'May 1, 2025',
                          ),
                        ),
                        Expanded(
                          child: MetaItem(
                            label: 'Due Date',
                            value: s.dueDate,
                            valueColor: s.status == SubscriberStatus.overdue
                                ? AppColors.error
                                : null,
                          ),
                        ),
                        Expanded(
                          child: MetaItem(label: 'Period', value: 'May 2025'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: context.spaceMedium),
                  Text(
                    'BILL TO',
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                      color: colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                  SizedBox(height: context.spaceSmall),
                  Row(
                    children: [
                      DashboardAvatar(name: s.name, size: 48),
                      SizedBox(width: context.paddingSmall),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            s.name,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            s.phone,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.6,
                              ),
                            ),
                          ),
                          Text(
                            '${s.area}, Beirut, Lebanon',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: context.spaceMedium),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: colorScheme.outline),
                      borderRadius: BorderRadius.circular(
                        context.borderRadiusMedium,
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.paddingMedium,
                            vertical: context.paddingSmall,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.secondary.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(context.borderRadiusMedium),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'DESCRIPTION',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.0,
                                    color: colorScheme.onSurface.withValues(
                                      alpha: 0.5,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'QTY',
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.0,
                                    color: colorScheme.onSurface.withValues(
                                      alpha: 0.5,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'RATE',
                                  textAlign: TextAlign.right,
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.0,
                                    color: colorScheme.onSurface.withValues(
                                      alpha: 0.5,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'TOTAL',
                                  textAlign: TextAlign.right,
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.0,
                                    color: colorScheme.onSurface.withValues(
                                      alpha: 0.5,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(context.paddingMedium),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Monthly Generator Subscription',
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Text(
                                      '${s.ampere} capacity · May 2025 · Beirut Grid Zone',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: colorScheme.onSurface
                                                .withValues(alpha: 0.6),
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '1',
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurface.withValues(
                                      alpha: 0.6,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '\$${s.amount}.00',
                                  textAlign: TextAlign.right,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontFamily: 'JetBrains Mono',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '\$${s.amount}.00',
                                  textAlign: TextAlign.right,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'JetBrains Mono',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: context.spaceMedium),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 220),
                      child: Column(
                        children: [
                          TotalRow(
                            label: 'Subtotal',
                            value: '\$${s.amount}.00',
                          ),
                          SizedBox(height: context.spaceSmall * 0.5),
                          TotalRow(label: 'Tax (0%)', value: '\$0.00'),
                          Divider(color: colorScheme.outline),
                          TotalRow(
                            label: 'Total Due',
                            value: '\$${s.amount}.00',
                            isTotal: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: context.spaceMedium),
                  Divider(color: colorScheme.outline),
                  SizedBox(height: context.spaceSmall),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'Thank you for your subscription. Questions? Call +961 71 000 000',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Payment via bank transfer (BLC Bank) or cash. El-Nour Generators, Hamra, Beirut.',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: 0.6),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onPrint() {}
  void _onDownload() {}
}
