import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/themes/app_colors.dart';
import 'package:shabakat/ui/data/app_data.dart';
import 'package:shabakat/ui/screens/dashboard/widgets/common/dashboard_avatar.dart';
import 'package:shabakat/ui/widgets/status_badge.dart';
import 'widgets/summary_card.dart';
import 'widgets/channel_chip.dart';
import 'widgets/send_button.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _isWhatsApp = true;
  final Set<int> _sentIds = {};

  List<Subscriber> get _pending => [];
  int get _remaining => _pending.where((s) => !_sentIds.contains(s.id)).length;

  void _send(int id) => setState(() => _sentIds.add(id));
  void _sendAll() => setState(() => _sentIds.addAll(_pending.map((s) => s.id)));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final pending = _pending;
    final remaining = _remaining;

    return SingleChildScrollView(
      padding: EdgeInsets.all(context.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: SummaryCard(
                  label: 'Pending',
                  value: pending.length.toString(),
                  valueColor: AppColors.error,
                ),
              ),
              SizedBox(width: context.paddingSmall),
              Expanded(
                child: SummaryCard(
                  label: 'Sent Today',
                  value: _sentIds.length.toString(),
                  valueColor: const Color(0xFF10B981),
                ),
              ),
              SizedBox(width: context.paddingSmall),
              Expanded(
                child: SummaryCard(
                  label: 'Remaining',
                  value: remaining.toString(),
                  valueColor: colorScheme.primary,
                ),
              ),
            ],
          ),
          SizedBox(height: context.spaceMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(context.paddingSmall * 0.5),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(
                    context.borderRadiusMedium,
                  ),
                  border: Border.all(color: colorScheme.outline),
                ),
                child: Row(
                  children: [
                    ChannelChip(
                      label: 'WhatsApp',
                      icon: LucideIcons.messageCircle,
                      isActive: _isWhatsApp,
                      activeColor: const Color(0xFF10B981),
                      onTap: () => setState(() => _isWhatsApp = true),
                    ),
                    ChannelChip(
                      label: 'SMS',
                      icon: LucideIcons.phone,
                      isActive: !_isWhatsApp,
                      activeColor: colorScheme.primary,
                      onTap: () => setState(() => _isWhatsApp = false),
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: remaining == 0 ? null : _sendAll,
                icon: const Icon(LucideIcons.send, size: 16),
                label: Text('Send All ($remaining)'),
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
                  Text(
                    'Message Template · ${_isWhatsApp ? 'WhatsApp' : 'SMS'}',
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0,
                      color: colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                  SizedBox(height: context.spaceSmall),
                  Container(
                    padding: EdgeInsets.all(context.paddingMedium),
                    decoration: BoxDecoration(
                      color: _isWhatsApp
                          ? const Color(0xFF10B981).withValues(alpha: 0.1)
                          : colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(
                        context.borderRadiusMedium,
                      ),
                      border: Border.all(
                        color: _isWhatsApp
                            ? const Color(0xFF10B981).withValues(alpha: 0.2)
                            : colorScheme.primary.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Text(
                      _isWhatsApp
                          ? '🔌 *El-Nour Generators* — Dear [Name], your monthly generator subscription of \$[Amount] is due on [Date]. Please arrange payment to avoid service interruption. Thank you! ⚡'
                          : 'El-Nour: Dear [Name], your \$[Amount] generator subscription is due [Date]. Pay via bank or cash to avoid disconnection. Call +961 71 000 000.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: _isWhatsApp
                            ? const Color(0xFF10B981)
                            : colorScheme.primary,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: context.spaceMedium),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(context.paddingMedium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pending Reminders',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Subscribers with unpaid or overdue invoices',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1, color: colorScheme.outline),
                ...pending.map((s) {
                  final isSent = _sentIds.contains(s.id);
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.paddingMedium,
                          vertical: context.paddingSmall,
                        ),
                        child: Row(
                          children: [
                            DashboardAvatar(name: s.name),
                            SizedBox(width: context.paddingSmall),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      Text(
                                        s.name,
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      SizedBox(
                                        width: context.paddingSmall * 0.5,
                                      ),
                                      StatusBadge(status: s.status),
                                    ],
                                  ),
                                  Text(
                                    '${s.phone} · ${s.area} · Due ${s.dueDate}',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSurface.withValues(
                                        alpha: 0.6,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '\$${s.amount}',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'JetBrains Mono',
                              ),
                            ),
                            SizedBox(width: context.paddingSmall),
                            SendButton(
                              isSent: isSent,
                              isWhatsApp: _isWhatsApp,
                              onTap: isSent ? null : () => _send(s.id),
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 1, color: colorScheme.outline),
                    ],
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
