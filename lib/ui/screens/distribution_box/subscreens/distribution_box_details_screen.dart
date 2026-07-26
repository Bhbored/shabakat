import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/customer/customer_filter_request.dart';
import 'package:shabakat/data/providers/customer/customer_filter_provider.dart';
import 'package:shabakat/data/providers/customer/customer_pagination_provider.dart';
import 'package:shabakat/data/providers/customer/customer_provider.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_provider.dart';
import 'package:shabakat/domain/entities/distribution_box/distribution_box.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/subscribers_pagination/subscribers_pagination.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

import 'distribution_box_edit_screen.dart';
import '../widgets/distribution_box_details/distribution_box_delete_dialog.dart';
import '../widgets/distribution_box_details/distribution_box_details_cables_section.dart';
import '../widgets/distribution_box_details/distribution_box_details_customers_section.dart';
import '../widgets/distribution_box_details/distribution_box_details_header.dart';

class DistributionBoxDetailsScreen extends ConsumerStatefulWidget {
  final DistributionBox box;
  final bool readOnly;

  const DistributionBoxDetailsScreen({
    super.key,
    required this.box,
    this.readOnly = false,
  });

  @override
  ConsumerState<DistributionBoxDetailsScreen> createState() =>
      _DistributionBoxDetailsScreenState();
}

class _DistributionBoxDetailsScreenState
    extends ConsumerState<DistributionBoxDetailsScreen> {
  static const _viewSwitchDuration = Duration(milliseconds: 280);

  bool _showCables = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(customerFilterProvider.notifier).updateFilter(
            const CustomerFilterRequest().copyWith(
              boxId: widget.box.id,
              pageNumber: 1,
            ),
          );
    });
  }

  DistributionBox _currentBox(List<DistributionBox>? boxes) {
    if (boxes == null) return widget.box;
    for (final box in boxes) {
      if (box.id == widget.box.id) return box;
    }
    return widget.box;
  }

  void _resetFilterAndPop() {
    ref.read(customerFilterProvider.notifier).clearFilter();
    Navigator.of(context).pop();
  }

  void _onViewChanged(bool showCables) {
    if (_showCables == showCables) return;
    setState(() => _showCables = showCables);
    ref
        .read(customerFilterProvider.notifier)
        .updateFilter(ref.read(customerFilterProvider).copyWith(pageNumber: 1));
  }

  Future<void> _onRefresh() async {
    await Future.wait([
      ref.read(customerProvider.notifier).refresh(),
      ref.read(distributionBoxProvider.notifier).refresh(),
    ]);
  }

  Future<void> _openEditScreen(DistributionBox box) {
    return Navigator.of(context).push(
      openInnerScreen(widget: DistributionBoxEditScreen(box: box)),
    );
  }

  Future<void> _showDeleteDialog(DistributionBox box) {
    return showAppDialog<void>(
      context: context,
      builder: (dialogContext) => DistributionBoxDeleteDialog(
        boxName: box.name,
        onConfirm: () => _onDeleteBox(
          dialogContext: dialogContext,
          boxId: box.id,
        ),
      ),
    );
  }

  Future<void> _onDeleteBox({
    required BuildContext dialogContext,
    required String boxId,
  }) async {
    try {
      await ref.read(distributionBoxProvider.notifier).deleteDistributionBox(
            boxId,
          );
      if (!dialogContext.mounted) return;
      Navigator.of(dialogContext).pop();
      if (!mounted) return;
      AppSnackBar.show(
        context,
        message: 'distribution_boxes.delete.success'.tr(),
        variant: AppSnackBarVariant.success,
      );
      _resetFilterAndPop();
    } catch (e) {
      if (!dialogContext.mounted) return;
      final message = e is ApiException
          ? e.userMessage
          : 'distribution_boxes.delete.failed'.tr();
      AppSnackBar.show(
        dialogContext,
        message: message,
        variant: AppSnackBarVariant.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final boxesAsync = ref.watch(distributionBoxProvider);
    final currentBox = _currentBox(boxesAsync.asData?.value);
    final pagination = ref.watch(customerPaginationProvider);
    final filterNotifier = ref.read(customerFilterProvider.notifier);

    void goToPage(int page) {
      ref
          .read(customerFilterProvider.notifier)
          .updateFilter(
            ref.read(customerFilterProvider).copyWith(pageNumber: page),
          );
    }

    return PopScope(
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) {
          ref.read(customerFilterProvider.notifier).clearFilter();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: _resetFilterAndPop,
          ),
          title: Text(
            'distribution_boxes.details.title'.tr(),
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            if (!widget.readOnly) ...[
              if (currentBox.customerCount == 0)
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => _showDeleteDialog(currentBox),
                ),
              IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: () => _openEditScreen(currentBox),
              ),
            ],
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DistributionBoxDetailsHeader(
              box: currentBox,
              showCables: _showCables,
              onViewChanged: _onViewChanged,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _onRefresh,
                child: AnimatedSwitcher(
                  duration: _viewSwitchDuration,
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  transitionBuilder: (child, animation) {
                    final slide = Tween<Offset>(
                      begin: const Offset(0, -0.06),
                      end: Offset.zero,
                    ).animate(animation);
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(position: slide, child: child),
                    );
                  },
                  child: _showCables
                      ? DistributionBoxDetailsCablesSection(
                          key: const ValueKey('box_cables'),
                          boxId: widget.box.id,
                        )
                      : DistributionBoxDetailsCustomersSection(
                          key: const ValueKey('box_subscribers'),
                          boxId: widget.box.id,
                          readOnly: widget.readOnly,
                        ),
                ),
              ),
            ),
            if (pagination.totalPages > 1)
              SubscribersPagination(
                currentPage: pagination.pageNumber,
                totalPages: pagination.totalPages,
                onPageChanged: goToPage,
                onFirstPage: filterNotifier.firstPage,
                onLastPage: filterNotifier.lastPage,
              ),
          ],
        ),
      ),
    );
  }
}
