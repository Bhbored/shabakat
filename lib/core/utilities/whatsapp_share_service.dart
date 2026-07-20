import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/enums/app_snack_bar_variant.dart';
import 'package:shabakat/core/utilities/invoice_pdf_exporter.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';
import 'package:whatsapp_share_fix/whatsapp_share_fix.dart';

part 'whatsapp_share_service.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
WhatsAppShareService whatsAppShareService(Ref ref) {
  final pdfExporter = ref.read(invoicePdfExporterProvider);
  return WhatsAppShareService(pdfExporter);
}

class WhatsAppShareService {
  late final InvoicePdfExporter _pdfExporter;
  final _logger = Logger();

  WhatsAppShareService(this._pdfExporter);

  Future<void> shareInvoiceToWhatsApp({
    required BuildContext context,
    required List<int> pdfBytes,
    required String customerName,
    required String phoneNumber,
  }) async {
    _logger.i('Starting WhatsApp invoice share for "$customerName"');

    final cleanNumber = _cleanPhoneNumber(phoneNumber);
    if (cleanNumber.isEmpty) {
      _logger.w('Missing phone number; aborting WhatsApp share');
      if (context.mounted) {
        AppSnackBar.show(
          context,
          message: 'invoices.print.whatsapp_phone_missing'.tr(),
          variant: AppSnackBarVariant.error,
        );
      }
      return;
    }

    try {
      final directory = await getTemporaryDirectory();
      final file = await _pdfExporter.savePdfFile(
        directory: directory,
        pdfBytes: pdfBytes,
        customerName: customerName,
      );
      _logger.d('PDF ready for WhatsApp share: ${file.path}');

      final whatsAppPackage = await _resolveWhatsAppPackage();
      if (whatsAppPackage == null) {
        _logger.w('WhatsApp is not installed; aborting share');
        if (context.mounted) {
          AppSnackBar.show(
            context,
            message: 'WhatsApp is not installed',
            variant: AppSnackBarVariant.error,
          );
        }
        return;
      }

      _logger.d(
        'Opening WhatsApp share '
        '(phone digits: ${cleanNumber.length}, file: ${file.path})',
      );

      await WhatsAppShareFix.sharePdf(
        phone: cleanNumber,
        filePath: file.path,
        text: 'Invoice for $customerName',
        package: whatsAppPackage,
      );

      _logger.i('WhatsApp share launched for "$customerName"');
    } catch (e, stackTrace) {
      _logger.e(
        'WhatsApp invoice share failed for "$customerName"',
        error: e,
        stackTrace: stackTrace,
      );
      if (context.mounted) {
        AppSnackBar.show(
          context,
          message: 'Failed to open WhatsApp: $e',
          variant: AppSnackBarVariant.error,
        );
      }
    }
  }

  Future<WhatsAppPackage?> _resolveWhatsAppPackage() async {
    for (final package in [
      WhatsAppPackage.consumer,
      WhatsAppPackage.business,
    ]) {
      try {
        final isInstalled = await WhatsAppShareFix.isInstalled(package: package);
        _logger.d('WhatsApp package check ($package): $isInstalled');
        if (isInstalled) return package;
      } catch (e, stackTrace) {
        _logger.e(
          'WhatsApp package check failed for $package',
          error: e,
          stackTrace: stackTrace,
        );
      }
    }
    return null;
  }

  String _cleanPhoneNumber(String phoneNumber) {
    var digits = phoneNumber.replaceAll(RegExp(r'\D'), '');
    if (digits.isEmpty) return '';

    if (digits.startsWith('00')) {
      digits = digits.substring(2);
    }

    if (digits.startsWith('961')) {
      return digits;
    }

    if (digits.startsWith('0')) {
      digits = digits.replaceFirst(RegExp(r'^0+'), '');
    }

    if (digits.isEmpty) return '';
    return '961$digits';
  }
}
