import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/distribution_box/create_distribution_box_request.dart';
import 'package:shabakat/data/providers/distribution_box/distribution_box_provider.dart';
import 'package:shabakat/domain/entities/area/area.dart';
import 'package:shabakat/ui/screens/subscribers/subscreens/area_selecting_screen.dart';
import 'package:shabakat/ui/screens/subscribers/widgets/area_select/area_select_field.dart';
import 'package:shabakat/ui/shared/inner_screens/dynamic_inner_screen.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

class DistributionBoxAddingScreen extends ConsumerStatefulWidget {
  const DistributionBoxAddingScreen({super.key});

  @override
  ConsumerState<DistributionBoxAddingScreen> createState() =>
      _DistributionBoxAddingScreenState();
}

class _DistributionBoxAddingScreenState
    extends ConsumerState<DistributionBoxAddingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _areaFieldKey = GlobalKey<FormFieldState<Area>>();
  final _nameController = TextEditingController();
  final _locationNoteController = TextEditingController();
  final _notesController = TextEditingController();

  bool _isLoading = false;

  Area? get _selectedArea => _areaFieldKey.currentState?.value;

  @override
  void dispose() {
    _nameController.dispose();
    _locationNoteController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _onSelectArea() async {
    final result = await Navigator.of(
      context,
    ).push(openInnerScreen(widget: const AreaSelectingScreen()));
    if (result is Area) _areaFieldKey.currentState?.didChange(result);
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    final area = _selectedArea;
    if (area == null) return;

    setState(() => _isLoading = true);

    final request = CreateDistributionBoxRequest(
      name: _nameController.text.trim(),
      areaId: area.id,
      locationNote: _trimOrNull(_locationNoteController.text),
      notes: _trimOrNull(_notesController.text),
    );

    var success = false;
    late String message;
    late AppSnackBarVariant variant;

    try {
      await ref
          .read(distributionBoxProvider.notifier)
          .createDistributionBox(request);
      success = true;
      message = 'Distribution box created.';
      variant = AppSnackBarVariant.success;
    } catch (e) {
      success = false;
      message = e is ApiException
          ? e.userMessage
          : 'Failed to create distribution box.';
      variant = AppSnackBarVariant.error;
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
        AppSnackBar.show(context, message: message, variant: variant);
        if (success) Navigator.of(context).pop();
      }
    }
  }

  String? _trimOrNull(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required.';
    }
    if (value.trim().length > 200) {
      return 'Name must be at most 200 characters.';
    }
    return null;
  }

  String? _validateOptional(String? value, int maxLength, String label) {
    if (value == null || value.trim().isEmpty) return null;
    if (value.trim().length > maxLength) {
      return '$label must be at most $maxLength characters.';
    }
    return null;
  }

  String? _validateArea(Area? value) {
    if (value == null) return 'Area is required.';
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
        title: const Text('Add distribution box'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name', style: theme.textTheme.titleMedium),
              SizedBox(height: context.spaceSmall),
              TextFormField(
                controller: _nameController,
                enabled: !_isLoading,
                textInputAction: TextInputAction.next,
                validator: _validateName,
                decoration: const InputDecoration(hintText: 'Panel 1'),
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
              Text('Location note', style: theme.textTheme.titleMedium),
              SizedBox(height: context.spaceSmall),
              TextFormField(
                controller: _locationNoteController,
                enabled: !_isLoading,
                textInputAction: TextInputAction.next,
                validator: (value) =>
                    _validateOptional(value, 500, 'Location note'),
                decoration: const InputDecoration(
                  hintText: 'Building entrance',
                ),
              ),
              SizedBox(height: context.spaceMedium),
              Text('Notes', style: theme.textTheme.titleMedium),
              SizedBox(height: context.spaceSmall),
              TextFormField(
                controller: _notesController,
                enabled: !_isLoading,
                maxLines: 3,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => _onSubmit(),
                validator: (value) => _validateOptional(value, 1000, 'Notes'),
                decoration: const InputDecoration(hintText: 'Optional notes'),
              ),
              SizedBox(height: context.spaceExtraLarge),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _onSubmit,
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text('Create', style: theme.textTheme.titleMedium),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
