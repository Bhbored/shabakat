import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/customer/suspend_customers_request.dart';
import 'package:shabakat/core/network/dto/response/customer/suspend_customers_response.dart';
import 'package:shabakat/data/providers/customer/customer_provider.dart';
import 'package:shabakat/data/providers/customer/customer_selection_provider.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

import 'subscriber_suspend_confirm_content.dart';
import 'subscriber_suspend_error_content.dart';
import 'subscriber_suspend_loading_content.dart';
import 'subscriber_suspend_success_content.dart';

enum _SuspendStep { confirm, loading, success, error }

Future<void> showSubscriberSuspendDialog({
  required BuildContext context,
  required List<String> customerIds,
}) {
  return showAppDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) => SubscriberSuspendDialog(
      scaffoldContext: context,
      customerIds: customerIds,
    ),
  );
}

class SubscriberSuspendDialog extends ConsumerStatefulWidget {
  final BuildContext scaffoldContext;
  final List<String> customerIds;

  const SubscriberSuspendDialog({
    super.key,
    required this.scaffoldContext,
    required this.customerIds,
  });

  @override
  ConsumerState<SubscriberSuspendDialog> createState() =>
      _SubscriberSuspendDialogState();
}

class _SubscriberSuspendDialogState
    extends ConsumerState<SubscriberSuspendDialog> {
  _SuspendStep _step = _SuspendStep.confirm;
  SuspendCustomersResponse? _response;
  String? _errorMessage;

  Future<void> _onSuspend() async {
    setState(() => _step = _SuspendStep.loading);

    try {
      final response = await ref
          .read(customerProvider.notifier)
          .suspendCustomers(
            SuspendCustomersRequest(customerIds: widget.customerIds),
          );
      if (!mounted) return;
      setState(() {
        _response = response;
        _step = _SuspendStep.success;
      });
      ref.read(customerSelectionProvider.notifier).clear();
      if (widget.scaffoldContext.mounted) {
        AppSnackBar.show(
          widget.scaffoldContext,
          message: response.message,
          variant: AppSnackBarVariant.success,
        );
      }
    } catch (e) {
      if (!mounted) return;
      final message = e is ApiException
          ? e.userMessage
          : 'subscribers.suspend.failed'.tr();
      setState(() {
        _errorMessage = message;
        _step = _SuspendStep.error;
      });
      AppSnackBar.show(
        context,
        message: message,
        variant: AppSnackBarVariant.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isLoading = _step == _SuspendStep.loading;

    return PopScope(
      canPop: !isLoading,
      child: AppAlertDialog(
        title: Row(
          children: [
            Icon(LucideIcons.pauseCircle, color: colorScheme.primary, size: 22),
            SizedBox(width: context.spaceSmall),
            Expanded(child: Text('subscribers.suspend.title'.tr())),
          ],
        ),
        content: switch (_step) {
          _SuspendStep.confirm => SubscriberSuspendConfirmContent(
            count: widget.customerIds.length,
          ),
          _SuspendStep.loading => const SubscriberSuspendLoadingContent(),
          _SuspendStep.success => SubscriberSuspendSuccessContent(
            response: _response!,
          ),
          _SuspendStep.error => SubscriberSuspendErrorContent(
            message: _errorMessage!,
          ),
        },
        actions: switch (_step) {
          _SuspendStep.confirm => [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('settings.cancel'.tr()),
            ),
            ElevatedButton(
              onPressed: _onSuspend,
              child: Text('subscribers.suspend.confirm'.tr()),
            ),
          ],
          _SuspendStep.loading => const [],
          _SuspendStep.success => [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('subscribers.suspend.done'.tr()),
            ),
          ],
          _SuspendStep.error => [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('subscribers.suspend.close'.tr()),
            ),
            ElevatedButton(
              onPressed: () => setState(() {
                _step = _SuspendStep.confirm;
                _errorMessage = null;
              }),
              child: Text('subscribers.suspend.try_again'.tr()),
            ),
          ],
        },
      ),
    );
  }
}
