// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(invoiceService)
final invoiceServiceProvider = InvoiceServiceProvider._();

final class InvoiceServiceProvider
    extends $FunctionalProvider<InvoiceService, InvoiceService, InvoiceService>
    with $Provider<InvoiceService> {
  InvoiceServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'invoiceServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$invoiceServiceHash();

  @$internal
  @override
  $ProviderElement<InvoiceService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  InvoiceService create(Ref ref) {
    return invoiceService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InvoiceService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InvoiceService>(value),
    );
  }
}

String _$invoiceServiceHash() => r'f3b13888fc232b8bed10fbd300d87ca6e60395ec';
