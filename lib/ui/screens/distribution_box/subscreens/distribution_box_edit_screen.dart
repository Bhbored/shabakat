import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/distribution_box/update_distribution_box_request.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_provider.dart';
import 'package:shabakat/domain/entities/area/area.dart';
import 'package:shabakat/domain/entities/distribution_box/distribution_box.dart';
import 'package:shabakat/ui/screens/subscribers/subscreens/area_selecting_screen.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/area_select/area_select_field.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

class DistributionBoxEditScreen extends ConsumerStatefulWidget {
  final DistributionBox box;

  const DistributionBoxEditScreen({super.key, required this.box});

  @override
  ConsumerState<DistributionBoxEditScreen> createState() =>
      _DistributionBoxEditScreenState();
}

class _DistributionBoxEditScreenState
    extends ConsumerState<DistributionBoxEditScreen> {
  static const _nameMaxLength = 200;
  static const _locationNoteMaxLength = 500;
  static const _notesMaxLength = 1000;

  final _formKey = GlobalKey<FormState>();
  final _areaFieldKey = GlobalKey<FormFieldState<Area>>();
  final _nameController = TextEditingController();
  final _locationNoteController = TextEditingController();
  final _notesController = TextEditingController();

  bool _isLoading = false;

  Area? get _selectedArea => _areaFieldKey.currentState?.value;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.box.name;
    _locationNoteController.text = widget.box.locationNote ?? '';
    _notesController.text = widget.box.notes ?? '';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _areaFieldKey.currentState?.didChange(_initialArea());
    });
  }

  Area _initialArea() {
    return Area(
      id: widget.box.areaId,
      name: widget.box.areaName,
      createdAt: widget.box.createdAt,
      updatedAt: widget.box.createdAt,
      companyId: '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationNoteController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  String? _trimOrNull(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  bool get _hasChanges {
    final area = _selectedArea;
    if (area == null) return false;
    return _nameController.text.trim() != widget.box.name ||
        area.id != widget.box.areaId ||
        _trimOrNull(_locationNoteController.text) != widget.box.locationNote ||
        _trimOrNull(_notesController.text) != widget.box.notes;
  }

  Future<void> _onSelectArea() async {
    final result = await Navigator.of(
      context,
    ).push(openInnerScreen(widget: const AreaSelectingScreen()));
    if (result is Area) _areaFieldKey.currentState?.didChange(result);
    setState(() {});
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate() || !_hasChanges) return;
    final area = _selectedArea;
    if (area == null) return;

    setState(() => _isLoading = true);

    final request = UpdateDistributionBoxRequest(
      name: _nameController.text.trim(),
      areaId: area.id,
      locationNote: _trimOrNull(_locationNoteController.text),
      notes: _trimOrNull(_notesController.text),
    );

    var success = false;
    late String message;
    late AppSnackBarVariant variant;

    try {
      await ref.read(distributionBoxProvider.notifier).updateDistributionBox(
            request,
            widget.box.id,
          );
      success = true;
      message = 'distribution_boxes.edit.success'.tr();
      variant = AppSnackBarVariant.success;
    } catch (e) {
      message = e is ApiException
          ? e.userMessage
          : 'distribution_boxes.edit.failed'.tr();
      variant = AppSnackBarVariant.error;
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
        AppSnackBar.show(context, message: message, variant: variant);
        if (success) Navigator.of(context).pop();
      }
    }
  }

  String? _validateName(String? value) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return 'distribution_boxes.validation.name_required'.tr();
    }
    if (trimmed.length > _nameMaxLength) {
      return 'distribution_boxes.validation.max_characters'.tr(
        args: [_nameMaxLength.toString()],
      );
    }
    return null;
  }

  String? _validateOptional(String? value, int maxLength, String labelKey) {
    if (value == null || value.trim().isEmpty) return null;
    if (value.trim().length > maxLength) {
      return 'distribution_boxes.validation.field_max_characters'.tr(
        args: [labelKey.tr(), maxLength.toString()],
      );
    }
    return null;
  }

  String? _validateArea(Area? value) {
    if (value == null) {
      return 'distribution_boxes.validation.area_required'.tr();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
        ),
        title: Text('distribution_boxes.edit.title'.tr()),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Form(
          key: _formKey,
          onChanged: () => setState(() {}),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'distribution_boxes.form.name'.tr(),
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: context.spaceSmall),
              TextFormField(
                controller: _nameController,
                enabled: !_isLoading,
                maxLength: _nameMaxLength,
                textInputAction: TextInputAction.next,
                validator: _validateName,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'distribution_boxes.form.name_hint'.tr(),
                ),
              ),
              SizedBox(height: context.spaceMedium),
              FormField<Area>(
                key: _areaFieldKey,
                validator: _validateArea,
                builder: (field) => AreaSelectField(
                  areaName: field.value?.name,
                  errorText: field.errorText,
                  onTap: _isLoading ? () {} : _onSelectArea,
                ),
              ),
              SizedBox(height: context.spaceMedium),
              Text(
                'distribution_boxes.form.location_note'.tr(),
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: context.spaceSmall),
              TextFormField(
                controller: _locationNoteController,
                enabled: !_isLoading,
                maxLength: _locationNoteMaxLength,
                textInputAction: TextInputAction.next,
                validator: (value) => _validateOptional(
                  value,
                  _locationNoteMaxLength,
                  'distribution_boxes.form.location_note',
                ),
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'distribution_boxes.form.location_note_hint'.tr(),
                ),
              ),
              SizedBox(height: context.spaceMedium),
              Text(
                'distribution_boxes.form.notes'.tr(),
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: context.spaceSmall),
              TextFormField(
                controller: _notesController,
                enabled: !_isLoading,
                maxLines: 3,
                maxLength: _notesMaxLength,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => _onSubmit(),
                validator: (value) => _validateOptional(
                  value,
                  _notesMaxLength,
                  'distribution_boxes.form.notes',
                ),
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'distribution_boxes.form.notes_hint'.tr(),
                ),
              ),
              SizedBox(height: context.spaceExtraLarge),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading || !_hasChanges ? null : _onSubmit,
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(
                          'settings.save'.tr(),
                          style: theme.textTheme.titleMedium,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
