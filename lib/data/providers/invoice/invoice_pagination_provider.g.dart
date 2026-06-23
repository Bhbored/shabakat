// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_pagination_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(InvoicePaginationNotifier)
final invoicePaginationProvider = InvoicePaginationNotifierProvider._();

final class InvoicePaginationNotifierProvider
    extends $NotifierProvider<InvoicePaginationNotifier, InvoicePagination> {
  InvoicePaginationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'invoicePaginationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$invoicePaginationNotifierHash();

  @$internal
  @override
  InvoicePaginationNotifier create() => InvoicePaginationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InvoicePagination value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InvoicePagination>(value),
    );
  }
}

String _$invoicePaginationNotifierHash() =>
    r'4a4ef9ce4a19cfbbaf15573272d639bbbeb101c8';

abstract class _$InvoicePaginationNotifier
    extends $Notifier<InvoicePagination> {
  InvoicePagination build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<InvoicePagination, InvoicePagination>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<InvoicePagination, InvoicePagination>,
              InvoicePagination,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
