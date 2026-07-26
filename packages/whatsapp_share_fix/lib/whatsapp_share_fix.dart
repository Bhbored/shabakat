import 'package:flutter/services.dart';

enum WhatsAppPackage { consumer, business }

class WhatsAppShareFix {
  static const _channel = MethodChannel('whatsapp_share_fix');

  static Future<bool> isInstalled({
    WhatsAppPackage package = WhatsAppPackage.consumer,
  }) async {
    final result = await _channel.invokeMethod<bool>('isInstalled', {
      'package': _packageName(package),
    });
    return result ?? false;
  }

  static Future<void> sharePdf({
    required String phone,
    required String filePath,
    String? text,
    WhatsAppPackage package = WhatsAppPackage.consumer,
  }) async {
    await _channel.invokeMethod<void>('sharePdf', {
      'phone': phone,
      'filePath': filePath,
      'text': text,
      'package': _packageName(package),
    });
  }

  static String _packageName(WhatsAppPackage package) {
    return switch (package) {
      WhatsAppPackage.consumer => 'com.whatsapp',
      WhatsAppPackage.business => 'com.whatsapp.w4b',
    };
  }
}
