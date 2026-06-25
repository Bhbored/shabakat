import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/customer/customer_provider.dart';
import 'package:shabakat/data/providers/customer/customer_selection_provider.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/subscriber_suspend_dialog/subscriber_suspend_dialog.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

class SubscriberSelectionActions extends ConsumerWidget {
  const SubscriberSelectionActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selection = ref.watch(customerSelectionProvider);
    if (!selection.isSelectionMode) {
      return const SizedBox.shrink();
    }

    final isLoading = ref.watch(customerProvider).isLoading;
    final hasSelection = selection.selectedCustomerIds.isNotEmpty;
    final selectedIds = selection.selectedCustomerIds;
    final count = selectedIds.length;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          tooltip: 'Suspend',
          onPressed: isLoading || !hasSelection
              ? null
              : () {
                  if (selectedIds.isEmpty) return;
                  showSubscriberSuspendDialog(
                    context: context,
                    customerIds: selectedIds,
                  );
                },
          icon: const Icon(LucideIcons.pauseCircle),
        ),
        IconButton(
          tooltip: 'Delete',
          onPressed: isLoading || !hasSelection
              ? null
              : () async {
                  if (count == 0) return;

                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (dialogContext) => AlertDialog(
                      title: const Text('Delete Subscribers'),
                      content: Text(
                        'Are you sure you want to delete $count subscriber${count == 1 ? '' : 's'}? This action cannot be undone.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () =>
                              Navigator.of(dialogContext).pop(false),
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () =>
                              Navigator.of(dialogContext).pop(true),
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  );
                  if (confirmed != true || !context.mounted) return;

                  try {
                    final notifier = ref.read(customerProvider.notifier);
                    for (final customerId in selectedIds) {
                      await notifier.deleteCustomer(customerId);
                    }
                    if (!context.mounted) return;
                    ref.read(customerSelectionProvider.notifier).clear();
                    AppSnackBar.show(
                      context,
                      message: count == 1
                          ? 'Subscriber deleted'
                          : '$count subscribers deleted',
                      variant: AppSnackBarVariant.success,
                    );
                  } catch (e) {
                    if (!context.mounted) return;
                    final message = e is ApiException
                        ? e.userMessage
                        : 'Failed to delete subscribers. Please try again.';
                    AppSnackBar.show(
                      context,
                      message: message,
                      variant: AppSnackBarVariant.error,
                    );
                  }
                },
          icon: const Icon(LucideIcons.trash2),
        ),
      ],
    );
  }
}
