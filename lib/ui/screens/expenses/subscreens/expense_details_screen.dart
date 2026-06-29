import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/data/providers/expense/expense_provider.dart';
import 'package:shabakat/data/providers/expense/single_expense_provider.dart';
import 'package:shabakat/domain/entities/expenses/expenses.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

import '../widgets/expense_card/expense_type_badge.dart';
import '../widgets/expense_delete_dialog/expense_delete_dialog.dart';
import '../widgets/expense_details/expense_details_body.dart';
import '../widgets/expense_edit_sheet/expense_edit_sheet.dart';

class ExpenseDetailsScreen extends ConsumerWidget {
  final Expense expense;

  const ExpenseDetailsScreen({super.key, required this.expense});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final detailAsync = ref.watch(singleExpenseProvider(expense.id));
    final currentExpense = detailAsync.asData?.value ?? expense;

    Future<void> onRefresh() =>
        ref.read(singleExpenseProvider(expense.id).notifier).refresh();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'expenses.details.title'.tr(),
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () => ExpenseEditSheet.show(
              context,
              expenseId: currentExpense.id,
              expense: currentExpense,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => _showExpenseDeleteDialog(
              context: context,
              expense: currentExpense,
            ),
          ),
        ],
      ),
      body: detailAsync.when(
        skipLoadingOnRefresh: true,
        loading: () =>
            ExpenseDetailsBody(expense: expense, onRefresh: onRefresh),
        error: (err, _) {
          final message = err is ApiException
              ? err.userMessage
              : 'expenses.load_details_failed'.tr();
          return Center(child: Text(message, textAlign: TextAlign.center));
        },
        data: (fresh) =>
            ExpenseDetailsBody(expense: fresh, onRefresh: onRefresh),
      ),
    );
  }
}

String _expenseDeleteLabel(Expense expense) {
  final label = expense.label?.trim();
  if (label != null && label.isNotEmpty) return label;
  return '${ExpenseTypeBadge.labelFor(expense.expenseType)} · ${expense.amount.toStringAsFixed(2)}';
}

Future<void> _showExpenseDeleteDialog({
  required BuildContext context,
  required Expense expense,
}) {
  return showAppDialog<void>(
    context: context,
    builder: (dialogContext) => Consumer(
      builder: (context, ref, _) {
        final isDeleting = ref.watch(expenseProvider).isLoading;

        return ExpenseDeleteDialog(
          targetLabel: _expenseDeleteLabel(expense),
          isDeleting: isDeleting,
          onCancel: () => Navigator.of(dialogContext).pop(),
          onConfirm: () => _onDeleteExpense(
            dialogContext: dialogContext,
            scaffoldContext: context,
            ref: ref,
            expense: expense,
          ),
        );
      },
    ),
  );
}

Future<void> _onDeleteExpense({
  required BuildContext dialogContext,
  required BuildContext scaffoldContext,
  required WidgetRef ref,
  required Expense expense,
}) async {
  try {
    await ref.read(expenseProvider.notifier).deleteExpense(expense.id);
    if (!dialogContext.mounted) return;
    AppSnackBar.show(
      scaffoldContext,
      message: 'expenses.delete.success'.tr(),
      variant: AppSnackBarVariant.success,
    );
    Navigator.of(dialogContext).pop();
    if (scaffoldContext.mounted) {
      Navigator.of(scaffoldContext).pop();
    }
  } catch (e) {
    if (!dialogContext.mounted) return;
    final message = e is ApiException
        ? e.userMessage
        : 'expenses.delete.failed'.tr();
    AppSnackBar.show(
      dialogContext,
      message: message,
      variant: AppSnackBarVariant.error,
    );
  }
}
