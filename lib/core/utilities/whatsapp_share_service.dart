import 'package:android_intent_plus/android_intent.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/enums/app_snack_bar_variant.dart';
import 'package:shabakat/core/utilities/invoice_pdf_exporter.dart';
import 'package:shabakat/ui/shared/snack_bar/app_snack_bar.dart';
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
      final directory = await _pdfExporter.ensureInvoicesDownloadFolder();
      final file = await _pdfExporter.savePdfFile(
        directory: directory,
        pdfBytes: pdfBytes,
        customerName: customerName,
      );
      _logger.d('PDF ready for WhatsApp share: ${file.path}');

      if (!await _isWhatsAppInstalled()) {
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

      await _openWhatsAppWithFile(
        phoneNumber: cleanNumber,
        filePath: file.path,
        customerName: customerName,
      );
      _logger.i('WhatsApp share intent launched for "$customerName"');
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

  Future<bool> _isWhatsAppInstalled() async {
    try {
      final intent = AndroidIntent(
        action: 'android.intent.action.VIEW',
        package: 'com.whatsapp',
      );
      final result = await intent.canResolveActivity();
      final installed = result ?? false;
      _logger.d('WhatsApp installed check: $installed');
      return installed;
    } catch (e, stackTrace) {
      _logger.e(
        'WhatsApp installed check failed',
        error: e,
        stackTrace: stackTrace,
      );
      return false;
    }
  }

  Future<void> _openWhatsAppWithFile({
    required String phoneNumber,
    required String filePath,
    required String customerName,
  }) async {
    _logger.d(
      'Opening WhatsApp SEND intent '
      '(phone digits: ${phoneNumber.length}, file: $filePath)',
    );

    final intent = AndroidIntent(
      action: 'android.intent.action.SEND',
      type: 'application/pdf',
      package: 'com.whatsapp',
      data: 'whatsapp://send?phone=$phoneNumber',
      arguments: {
        'android.intent.extra.STREAM': 'file://$filePath',
        'android.intent.extra.TEXT': 'Invoice for $customerName',
      },
    );

    await intent.launch();
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
