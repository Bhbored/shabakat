import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/area/update_area_request.dart';
import 'package:shabakat/data/providers/area/area_provider.dart';
import 'package:shabakat/data/providers/customer/customer_filter_provider.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_filter_provider.dart';
import 'package:shabakat/domain/entities/area/area.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

import '../widgets/area_boxes_section/area_boxes_section.dart';
import '../widgets/area_customers_section/area_customers_section.dart';
import '../widgets/area_delete_dialog/area_delete_dialog.dart';
import '../widgets/area_details_header/area_details_header.dart';
import '../widgets/area_edit_dialog/area_edit_dialog.dart';

class AreaDetailsScreen extends ConsumerStatefulWidget {
  final Area area;
  final bool readOnly;

  const AreaDetailsScreen({
    super.key,
    required this.area,
    this.readOnly = false,
  });

  @override
  ConsumerState<AreaDetailsScreen> createState() => _AreaDetailsScreenState();
}

class _AreaDetailsScreenState extends ConsumerState<AreaDetailsScreen> {
  static const _nameMaxLength = 200;
  static const _viewSwitchDuration = Duration(milliseconds: 280);

  bool _showBoxes = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(customerFilterProvider.notifier).updateFilter(
            ref.read(customerFilterProvider).copyWith(
              areaId: widget.area.id,
              pageNumber: 1,
            ),
          );
    });
  }

  Area _currentArea(List<Area>? areas) {
    if (areas == null) return widget.area;
    for (final area in areas) {
      if (area.id == widget.area.id) return area;
    }
    return widget.area;
  }

  void _resetFilterAndPop() {
    ref.read(customerFilterProvider.notifier).clearFilter();
    ref.read(distributionBoxFilterProvider.notifier).clear();
    Navigator.of(context).pop();
  }

  void _onViewChanged(bool showBoxes) {
    if (_showBoxes == showBoxes) return;
    setState(() => _showBoxes = showBoxes);
    if (showBoxes) {
      ref.read(distributionBoxFilterProvider.notifier).update(
            ref.read(distributionBoxFilterProvider).copyWith(
              areaId: widget.area.id,
              name: null,
              pageNumber: 1,
            ),
          );
    } else {
      ref.read(customerFilterProvider.notifier).updateFilter(
            ref.read(customerFilterProvider).copyWith(
              areaId: widget.area.id,
              pageNumber: 1,
            ),
          );
    }
  }

  String? _validateAreaName(String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) return 'areas.validation.name_required'.tr();
    if (trimmed.length > _nameMaxLength) {
      return 'areas.validation.max_characters'.tr(
        args: [_nameMaxLength.toString()],
      );
    }
    return null;
  }

  Future<void> _showAreaEditDialog(Area area) {
    return showAppDialog<void>(
      context: context,
      builder: (dialogContext) => AreaEditDialog(
        initialName: area.name,
        maxLength: _nameMaxLength,
        validator: _validateAreaName,
        onSave: (name) => _onUpdateArea(
          dialogContext: dialogContext,
          areaId: area.id,
          name: name,
        ),
      ),
    );
  }

  Future<void> _onUpdateArea({
    required BuildContext dialogContext,
    required String areaId,
    required String name,
  }) async {
    try {
      await ref.read(areaProvider.notifier).updateArea(
            UpdateAreaRequest(name: name),
            areaId,
          );
      if (!dialogContext.mounted) return;
      Navigator.of(dialogContext).pop();
      if (!mounted) return;
      AppSnackBar.show(
        context,
        message: 'areas.edit.success'.tr(),
        variant: AppSnackBarVariant.success,
      );
    } catch (e) {
      if (!dialogContext.mounted) return;
      final message = e is ApiException
          ? e.userMessage
          : 'areas.edit.failed'.tr();
      AppSnackBar.show(
        dialogContext,
        message: message,
        variant: AppSnackBarVariant.error,
      );
    }
  }

  Future<void> _showAreaDeleteDialog(Area area) {
    return showAppDialog<void>(
      context: context,
      builder: (dialogContext) => AreaDeleteDialog(
        areaName: area.name,
        onConfirm: () => _onDeleteArea(
          dialogContext: dialogContext,
          areaId: area.id,
        ),
      ),
    );
  }

  Future<void> _onDeleteArea({
    required BuildContext dialogContext,
    required String areaId,
  }) async {
    try {
      await ref.read(areaProvider.notifier).deleteArea(areaId);
      if (!dialogContext.mounted) return;
      Navigator.of(dialogContext).pop();
      if (!mounted) return;
      AppSnackBar.show(
        context,
        message: 'areas.delete.success'.tr(),
        variant: AppSnackBarVariant.success,
      );
      _resetFilterAndPop();
    } catch (e) {
      if (!dialogContext.mounted) return;
      final message = e is ApiException
          ? e.userMessage
          : 'areas.delete.failed'.tr();
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
    final areasAsync = ref.watch(areaProvider);
    final currentArea = _currentArea(areasAsync.asData?.value);

    return PopScope(
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) {
          ref.read(customerFilterProvider.notifier).clearFilter();
          ref.read(distributionBoxFilterProvider.notifier).clear();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: _resetFilterAndPop,
          ),
          title: Text(
            'areas.details.title'.tr(),
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            if (!widget.readOnly) ...[
              if (currentArea.customerCount == 0)
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => _showAreaDeleteDialog(currentArea),
                ),
              IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: () => _showAreaEditDialog(currentArea),
              ),
            ],
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AreaDetailsHeader(
              area: currentArea,
              showBoxes: _showBoxes,
              onViewChanged: _onViewChanged,
            ),
            Expanded(
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
                    child: SlideTransition(
                      position: slide,
                      child: child,
                    ),
                  );
                },
                child: _showBoxes
                    ? AreaBoxesSection(
                        key: const ValueKey('area_boxes'),
                        readOnly: widget.readOnly,
                      )
                    : AreaCustomersSection(
                        key: const ValueKey('area_subscribers'),
                        readOnly: widget.readOnly,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
