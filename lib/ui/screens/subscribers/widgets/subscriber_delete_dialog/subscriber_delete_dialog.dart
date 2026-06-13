import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/customer/customer_provider.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

Future<void> showSubscriberDeleteDialog({
  required BuildContext context,
  required String customerId,
  required String customerName,
}) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) => SubscriberDeleteDialog(
      scaffoldContext: context,
      customerId: customerId,
      customerName: customerName,
    ),
  );
}

class SubscriberDeleteDialog extends ConsumerWidget {
  final BuildContext scaffoldContext;
  final String customerId;
  final String customerName;

  const SubscriberDeleteDialog({
    super.key,
    required this.scaffoldContext,
    required this.customerId,
    required this.customerName,
  });

  Future<void> _onDelete(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(customerProvider.notifier).deleteCustomer(customerId);
      if (!context.mounted) return;
      AppSnackBar.show(
        scaffoldContext,
        message: 'Subscriber deleted',
        variant: AppSnackBarVariant.success,
      );
      Navigator.of(context).pop();
      if (scaffoldContext.mounted) {
        Navigator.of(scaffoldContext).pop();
      }
    } catch (e) {
      if (!context.mounted) return;
      final message = e is ApiException
          ? e.userMessage
          : 'Failed to delete subscriber. Please try again.';
      AppSnackBar.show(
        context,
        message: message,
        variant: AppSnackBarVariant.error,
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDeleting = ref.watch(customerProvider).isLoading;

    return AlertDialog(
      title: const Text('Delete Subscriber'),
      content: Text(
        'Are you sure you want to delete "$customerName"? This action cannot be undone.',
        style: theme.textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: isDeleting ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: isDeleting ? null : () => _onDelete(context, ref),
          child: isDeleting
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Delete'),
        ),
      ],
    );
  }
}
