import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/core/constants/app_sizes.dart';
import 'package:shabakat/core/enums/app_snack_bar_variant.dart';
import 'package:shabakat/core/exceptions/api_exception.dart';
import 'package:shabakat/core/network/dto/request/company/update_profile_request.dart';
import 'package:shabakat/core/network/dto/response/company/get_profile_response.dart';
import 'package:shabakat/core/utilities/image_picker_helper.dart';
import 'package:shabakat/data/providers/company/company_profile_provider.dart';
import 'package:shabakat/ui/settings/widgets/company_name_edit_dialog.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CompanyProfileHeader extends ConsumerStatefulWidget {
  const CompanyProfileHeader({super.key});

  @override
  ConsumerState<CompanyProfileHeader> createState() =>
      _CompanyProfileHeaderState();
}

class _CompanyProfileHeaderState extends ConsumerState<CompanyProfileHeader> {
  Future<void> _pickAndUploadLogo() async {
    final uploadNotifier = ref.read(companyProfileUploadProvider.notifier);
    if (ref.read(companyProfileUploadProvider).isUploading) return;

    final pickResult = await ImagePickerHelper.showSourceSheetAndPick(context);
    if (!mounted) return;

    if (pickResult.pickerFailed) {
      AppSnackBar.show(
        context,
        message: 'settings.profile.picker_failed'.tr(),
        variant: AppSnackBarVariant.error,
      );
      return;
    }

    final path = pickResult.path;
    if (path == null || !mounted) return;

    if (!await ImagePickerHelper.isWithinSizeLimit(path)) {
      if (!mounted) return;
      AppSnackBar.show(
        context,
        message: 'settings.profile.logo_too_large'.tr(),
        variant: AppSnackBarVariant.error,
      );
      return;
    }

    uploadNotifier.update(
      CompanyProfileUploadState(isUploading: true, localLogoPath: path),
    );

    try {
      await ref.read(companyProfileProvider.notifier).updateProfile(
        UpdateProfileRequest(name: '', file: path),
      );
      if (!mounted) return;
      AppSnackBar.show(
        context,
        message: 'settings.profile.logo_uploaded'.tr(),
        variant: AppSnackBarVariant.success,
      );
    } catch (error) {
      if (!mounted) return;
      final message = error is ApiException
          ? error.userMessage
          : 'settings.profile.logo_upload_failed'.tr();
      AppSnackBar.show(
        context,
        message: message,
        variant: AppSnackBarVariant.error,
      );
    } finally {
      uploadNotifier.clear();
    }
  }

  Future<void> _showEditNameDialog(GetProfileResponse profile) {
    return showCompanyNameEditDialog(
      context: context,
      initialName: profile.name,
      onSave: (name) => ref.read(companyProfileProvider.notifier).updateProfile(
        UpdateProfileRequest(name: name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(companyProfileProvider);
    final upload = ref.watch(companyProfileUploadProvider);

    return profileAsync.when(
      skipLoadingOnRefresh: true,
      loading: () => const _ProfileCardSkeleton(),
      error: (error, _) => _ProfileCardError(
        message: error is ApiException
            ? error.userMessage
            : 'settings.profile.load_failed'.tr(),
        onRetry: () => ref.read(companyProfileProvider.notifier).refresh(),
      ),
      data: (profile) => _ProfileCard(
        profile: profile,
        localLogoPath: upload.localLogoPath,
        isUploadingLogo: upload.isUploading,
        onEditLogo: _pickAndUploadLogo,
        onEditName: () => _showEditNameDialog(profile),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  final GetProfileResponse profile;
  final String? localLogoPath;
  final bool isUploadingLogo;
  final VoidCallback onEditLogo;
  final VoidCallback onEditName;

  const _ProfileCard({
    required this.profile,
    required this.localLogoPath,
    required this.isUploadingLogo,
    required this.onEditLogo,
    required this.onEditName,
  });

  String _displayName() {
    final name = profile.name.trim();
    return name.isEmpty ? 'settings.not_set'.tr() : name;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.paddingMedium,
          vertical: context.paddingSmall,
        ),
        child: Row(
          children: [
            _LogoAvatar(
              logoUrl: profile.logoUrl,
              localLogoPath: localLogoPath,
              isUploading: isUploadingLogo,
              onEdit: onEditLogo,
            ),
            SizedBox(width: context.paddingMedium),
            Expanded(
              child: Text(
                _displayName(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            IconButton(
              onPressed: onEditName,
              tooltip: 'settings.profile.edit_name'.tr(),
              visualDensity: VisualDensity.compact,
              icon: Icon(
                LucideIcons.pencil,
                size: 16,
                color: colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileCardSkeleton extends StatelessWidget {
  const _ProfileCardSkeleton();

  @override
  Widget build(BuildContext context) {
    final size = context.screenWidth * 0.17;

    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.paddingMedium,
          vertical: context.paddingSmall,
        ),
        child: Skeletonizer(
          child: Row(
            children: [
              Bone.circle(size: size),
              SizedBox(width: context.paddingMedium),
              const Expanded(
                child: Bone.multiText(lines: 1),
              ),
              Bone.icon(size: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileCardError extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ProfileCardError({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      child: Padding(
        padding: EdgeInsets.all(context.paddingMedium),
        child: Row(
          children: [
            Icon(LucideIcons.alertCircle, color: colorScheme.error, size: 20),
            SizedBox(width: context.paddingSmall),
            Expanded(
              child: Text(
                message,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.error,
                ),
              ),
            ),
            IconButton(
              onPressed: onRetry,
              tooltip: 'errors.try_again'.tr(),
              icon: Icon(
                LucideIcons.refreshCw,
                size: 18,
                color: colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LogoAvatar extends StatelessWidget {
  final String? logoUrl;
  final String? localLogoPath;
  final bool isUploading;
  final VoidCallback onEdit;

  const _LogoAvatar({
    required this.logoUrl,
    required this.localLogoPath,
    required this.isUploading,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = context.screenWidth * 0.17;
    final editSize = size * 0.34;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.primary.withValues(alpha: 0.08),
            ),
            clipBehavior: Clip.antiAlias,
            child: _LogoImage(
              size: size,
              logoUrl: logoUrl,
              localLogoPath: localLogoPath,
            ),
          ),
          if (isUploading)
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorScheme.scrim.withValues(alpha: 0.35),
                ),
                child: Center(
                  child: SizedBox(
                    width: size * 0.3,
                    height: size * 0.3,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
          if (!isUploading)
            Positioned(
              right: 0,
              bottom: 0,
              child: Semantics(
                button: true,
                label: 'settings.profile.edit_logo'.tr(),
                child: Material(
                  color: colorScheme.primary,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: onEdit,
                    child: SizedBox(
                      width: editSize,
                      height: editSize,
                      child: Icon(
                        LucideIcons.pencil,
                        size: editSize * 0.5,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _LogoImage extends StatelessWidget {
  final double size;
  final String? logoUrl;
  final String? localLogoPath;

  const _LogoImage({
    required this.size,
    required this.logoUrl,
    required this.localLogoPath,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final placeholder = Icon(
      LucideIcons.image,
      size: size * 0.4,
      color: colorScheme.onSurface.withValues(alpha: 0.35),
    );

    if (localLogoPath != null) {
      return Image.file(
        File(localLogoPath!),
        fit: BoxFit.cover,
        width: size,
        height: size,
      );
    }

    final url = logoUrl?.trim();
    if (url != null && url.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        width: size,
        height: size,
        placeholder: (_, _) => Center(
          child: SizedBox(
            width: size * 0.3,
            height: size * 0.3,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: colorScheme.primary,
            ),
          ),
        ),
        errorWidget: (_, _, _) => placeholder,
      );
    }

    return placeholder;
  }
}
