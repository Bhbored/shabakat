import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/area/create_area_request.dart';
import 'package:shabakat/data/providers/area/area_provider.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

class AreaAddingScreen extends ConsumerStatefulWidget {
  const AreaAddingScreen({super.key});

  @override
  ConsumerState<AreaAddingScreen> createState() => _AreaAddingScreenState();
}

class _AreaAddingScreenState extends ConsumerState<AreaAddingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final request = CreateAreaRequest(name: _nameController.text.trim());

    var success = false;
    late String message;
    late AppSnackBarVariant variant;

    try {
      await ref.read(areaProvider.notifier).createArea(request);
      success = true;
      message = 'areas.add.success'.tr();
      variant = AppSnackBarVariant.success;
    } catch (e) {
      success = false;
      message = e is ApiException
          ? e.userMessage
          : 'areas.add.failed'.tr();
      variant = AppSnackBarVariant.error;
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
        AppSnackBar.show(context, message: message, variant: variant);
        if (success) Navigator.of(context).pop();
      }
    }
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
        title: Text('areas.add.title'.tr()),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('areas.add.name_label'.tr(), style: theme.textTheme.titleMedium),
              SizedBox(height: context.spaceSmall),
              TextFormField(
                controller: _nameController,
                enabled: !_isLoading,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => _onSubmit(),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'areas.validation.required'.tr();
                  }
                  if (value.trim().length > 200) {
                    return 'areas.validation.max_characters'.tr(args: ['200']);
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'areas.add.name_hint'.tr(),
                ),
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
                      : Text('areas.add.submit'.tr()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
