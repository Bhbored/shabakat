import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/customer/customer_provider.dart';
import 'package:shabakat/data/providers/customer/customer_selection_provider.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/subscriber_suspend_dialog/subscriber_suspend_dialog.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';
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
          tooltip: 'subscribers.actions.suspend'.tr(),
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
          tooltip: 'subscribers.actions.delete'.tr(),
          onPressed: isLoading || !hasSelection
              ? null
              : () async {
                  if (count == 0) return;

                  final confirmed = await showAppDialog<bool>(
                    context: context,
                    builder: (dialogContext) => AppAlertDialog(
                      title: Text('subscribers.delete_bulk.title'.tr()),
                      content: Text(
                        count == 1
                            ? 'subscribers.delete_bulk.message_one'.tr(
                                args: [count.toString()],
                              )
                            : 'subscribers.delete_bulk.message_many'.tr(
                                args: [count.toString()],
                              ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () =>
                              Navigator.of(dialogContext).pop(false),
                          child: Text('settings.cancel'.tr()),
                        ),
                        ElevatedButton(
                          onPressed: () =>
                              Navigator.of(dialogContext).pop(true),
                          child: Text('subscribers.actions.delete'.tr()),
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
                          ? 'subscribers.delete.success_one'.tr()
                          : 'subscribers.delete.success_many'.tr(
                              args: [count.toString()],
                            ),
                      variant: AppSnackBarVariant.success,
                    );
                  } catch (e) {
                    if (!context.mounted) return;
                    final message = e is ApiException
                        ? e.userMessage
                        : 'subscribers.delete.failed_bulk'.tr();
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
