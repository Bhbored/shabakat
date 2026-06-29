import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:shabakat/ui/shared/dialogs/app_modal.dart';

enum LogoImageSource { camera, gallery }

class LogoPickResult {
  const LogoPickResult({this.path, this.pickerFailed = false});

  final String? path;
  final bool pickerFailed;

  bool get cancelled => path == null && !pickerFailed;
}

abstract final class ImagePickerHelper {
  static const maxLogoBytes = 2 * 1024 * 1024;

  static final ImagePicker _picker = ImagePicker();

  static Future<LogoPickResult> showSourceSheetAndPick(
    BuildContext context,
  ) async {
    final source = await showAppBottomSheet<LogoImageSource>(
      context: context,
      builder: (sheetContext) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(LucideIcons.camera),
              title: Text('settings.profile.camera'.tr()),
              onTap: () =>
                  Navigator.pop(sheetContext, LogoImageSource.camera),
            ),
            ListTile(
              leading: const Icon(LucideIcons.image),
              title: Text('settings.profile.gallery'.tr()),
              onTap: () =>
                  Navigator.pop(sheetContext, LogoImageSource.gallery),
            ),
          ],
        );
      },
    );

    if (source == null) return const LogoPickResult();

    // Native picker must open after the sheet route has fully closed.
    await Future<void>.delayed(const Duration(milliseconds: 350));

    return pickImage(source);
  }

  static Future<LogoPickResult> pickImage(LogoImageSource source) async {
    try {
      final picked = await _picker.pickImage(
        source: source == LogoImageSource.camera
            ? ImageSource.camera
            : ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
        requestFullMetadata: false,
      );
      return LogoPickResult(path: picked?.path);
    } on PlatformException {
      return const LogoPickResult(pickerFailed: true);
    }
  }

  static Future<bool> isWithinSizeLimit(String path) async {
    final length = await File(path).length();
    return length <= maxLogoBytes;
  }
}
