// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whatsapp_share_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(whatsAppShareService)
final whatsAppShareServiceProvider = WhatsAppShareServiceProvider._();

final class WhatsAppShareServiceProvider
    extends
        $FunctionalProvider<
          WhatsAppShareService,
          WhatsAppShareService,
          WhatsAppShareService
        >
    with $Provider<WhatsAppShareService> {
  WhatsAppShareServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'whatsAppShareServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$whatsAppShareServiceHash();

  @$internal
  @override
  $ProviderElement<WhatsAppShareService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WhatsAppShareService create(Ref ref) {
    return whatsAppShareService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WhatsAppShareService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WhatsAppShareService>(value),
    );
  }
}

String _$whatsAppShareServiceHash() =>
    r'c5f600852bc6b11ab99f4a4c325a265dcb67157c';
