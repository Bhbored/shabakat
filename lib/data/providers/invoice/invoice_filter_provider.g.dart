// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_filter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(InvoiceFilterNotifier)
final invoiceFilterProvider = InvoiceFilterNotifierProvider._();

final class InvoiceFilterNotifierProvider
    extends $NotifierProvider<InvoiceFilterNotifier, InvoiceFilterRequest> {
  InvoiceFilterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'invoiceFilterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$invoiceFilterNotifierHash();

  @$internal
  @override
  InvoiceFilterNotifier create() => InvoiceFilterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InvoiceFilterRequest value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InvoiceFilterRequest>(value),
    );
  }
}

String _$invoiceFilterNotifierHash() =>
    r'206abf5480e28407a79b55928bb288c689ddd065';

abstract class _$InvoiceFilterNotifier extends $Notifier<InvoiceFilterRequest> {
  InvoiceFilterRequest build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<InvoiceFilterRequest, InvoiceFilterRequest>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<InvoiceFilterRequest, InvoiceFilterRequest>,
              InvoiceFilterRequest,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
