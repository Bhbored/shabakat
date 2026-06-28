import 'package:easy_localization/easy_localization.dart';
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
        message: 'subscribers.delete.success_one'.tr(),
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
          : 'subscribers.delete.failed'.tr();
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
      title: Text('subscribers.delete.title'.tr()),
      content: Text(
        'subscribers.delete.message'.tr(args: [customerName]),
        style: theme.textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: isDeleting ? null : () => Navigator.of(context).pop(),
          child: Text('settings.cancel'.tr()),
        ),
        ElevatedButton(
          onPressed: isDeleting ? null : () => _onDelete(context, ref),
          child: isDeleting
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text('subscribers.actions.delete'.tr()),
        ),
      ],
    );
  }
}
