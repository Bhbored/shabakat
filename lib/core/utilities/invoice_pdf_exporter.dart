import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shabakat/core/enums/enums.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';

part 'invoice_pdf_exporter.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
InvoicePdfExporter invoicePdfExporter(Ref ref) {
  return InvoicePdfExporter();
}

class InvoicePdfExporter {
  static const _invoicesFolderName = 'invoices';
  static const _androidPublicDownloadsPath = '/storage/emulated/0/Download';

  final _logger = Logger();

  Future<Directory> ensureInvoicesDownloadFolder() async {
    final downloadsRoot = Platform.isAndroid
        ? _androidPublicDownloadsPath
        : (await getDownloadsDirectory())?.path;

    if (downloadsRoot == null) {
      throw StateError('Downloads directory is not available on this device.');
    }

    final invoicesDirectory = Directory(
      p.join(downloadsRoot, _invoicesFolderName),
    );

    _logger.d('Ensuring invoices folder at ${invoicesDirectory.path}');

    if (!await invoicesDirectory.exists()) {
      await invoicesDirectory.create(recursive: true);
      _logger.d('Created invoices folder');
    }

    _logger.i('Invoices folder ready: ${invoicesDirectory.path}');
    return invoicesDirectory;
  }

  Future<File> savePdfFile({
    required Directory directory,
    required List<int> pdfBytes,
    required String customerName,
  }) async {
    final fileName = _buildFileName(customerName);
    final file = File(p.join(directory.path, fileName));

    _logger.d('Writing PDF to ${file.path}');
    await file.writeAsBytes(pdfBytes, flush: true);

    if (!await file.exists() || await file.length() == 0) {
      throw StateError('PDF file was not saved at ${file.path}');
    }

    _logger.i('Invoice PDF saved (${await file.length()} bytes): ${file.path}');
    return file;
  }

  Future<void> shareInvoicePdf({
    required BuildContext context,
    required List<int> pdfBytes,
    required String customerName,
  }) async {
    _logger.i('Starting invoice PDF share for "$customerName"');

    try {
      final directory = await ensureInvoicesDownloadFolder();
      final file = await savePdfFile(
        directory: directory,
        pdfBytes: pdfBytes,
        customerName: customerName,
      );

      _logger.i(
        'Invoice PDF ready to share for "$customerName" at ${file.path}',
      );

      if (context.mounted) {
        AppSnackBar.show(
          context,
          message: 'invoices.print.export_success'.tr(),
          variant: AppSnackBarVariant.success,
        );
      }

      await SharePlus.instance.share(
        ShareParams(
          files: [
            XFile(
              file.path,
              mimeType: 'application/pdf',
              name: p.basename(file.path),
            ),
          ],
          subject: customerName,
        ),
      );
    } catch (e, stackTrace) {
      _logger.e(
        'Invoice PDF share failed for "$customerName"',
        error: e,
        stackTrace: stackTrace,
      );

      if (context.mounted) {
        AppSnackBar.show(
          context,
          message: 'invoices.print.share_failed'.tr(),
          variant: AppSnackBarVariant.error,
        );
      }
    }
  }

  String _buildFileName(String customerName) {
    final sanitizedName = _sanitizeFileName(customerName);
    final timestamp = _fileTimestamp(DateTime.now());
    return '${sanitizedName}_$timestamp.pdf';
  }

  String _sanitizeFileName(String name) {
    final sanitized = name
        .trim()
        .replaceAll(RegExp(r'[\\/:*?"<>|]'), '_')
        .replaceAll(RegExp(r'\s+'), '_')
        .replaceAll(RegExp(r'_+'), '_')
        .replaceAll(RegExp(r'^_|_$'), '');

    return sanitized.isEmpty ? 'invoice' : sanitized;
  }

  String _fileTimestamp(DateTime dateTime) {
    String twoDigits(int value) => value.toString().padLeft(2, '0');

    return '${dateTime.year}${twoDigits(dateTime.month)}${twoDigits(dateTime.day)}_'
        '${twoDigits(dateTime.hour)}${twoDigits(dateTime.minute)}${twoDigits(dateTime.second)}';
  }
}
