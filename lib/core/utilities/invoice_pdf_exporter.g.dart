// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_pdf_exporter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(invoicePdfExporter)
final invoicePdfExporterProvider = InvoicePdfExporterProvider._();

final class InvoicePdfExporterProvider
    extends
        $FunctionalProvider<
          InvoicePdfExporter,
          InvoicePdfExporter,
          InvoicePdfExporter
        >
    with $Provider<InvoicePdfExporter> {
  InvoicePdfExporterProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'invoicePdfExporterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$invoicePdfExporterHash();

  @$internal
  @override
  $ProviderElement<InvoicePdfExporter> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InvoicePdfExporter create(Ref ref) {
    return invoicePdfExporter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InvoicePdfExporter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InvoicePdfExporter>(value),
    );
  }
}

String _$invoicePdfExporterHash() =>
    r'e8acd1d5bc602b66e036ed8847970c577bff51ba';
