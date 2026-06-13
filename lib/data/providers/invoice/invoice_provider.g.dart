// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(InvoiceNotifier)
final invoiceProvider = InvoiceNotifierProvider._();

final class InvoiceNotifierProvider
    extends $AsyncNotifierProvider<InvoiceNotifier, List<Invoice>> {
  InvoiceNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'invoiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$invoiceNotifierHash();

  @$internal
  @override
  InvoiceNotifier create() => InvoiceNotifier();
}

String _$invoiceNotifierHash() => r'38b921cbe3167606c73ba7e2d9535b9cb9940392';

abstract class _$InvoiceNotifier extends $AsyncNotifier<List<Invoice>> {
  FutureOr<List<Invoice>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Invoice>>, List<Invoice>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Invoice>>, List<Invoice>>,
              AsyncValue<List<Invoice>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
