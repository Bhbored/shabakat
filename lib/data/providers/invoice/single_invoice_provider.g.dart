// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_invoice_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SingleInvoiceNotifier)
final singleInvoiceProvider = SingleInvoiceNotifierFamily._();

final class SingleInvoiceNotifierProvider
    extends $AsyncNotifierProvider<SingleInvoiceNotifier, Invoice> {
  SingleInvoiceNotifierProvider._({
    required SingleInvoiceNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: retry,
         name: r'singleInvoiceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$singleInvoiceNotifierHash();

  @override
  String toString() {
    return r'singleInvoiceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SingleInvoiceNotifier create() => SingleInvoiceNotifier();

  @override
  bool operator ==(Object other) {
    return other is SingleInvoiceNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$singleInvoiceNotifierHash() =>
    r'e6a8bd1d13ec7a1be39979eb8635a6e332dba733';

final class SingleInvoiceNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          SingleInvoiceNotifier,
          AsyncValue<Invoice>,
          Invoice,
          FutureOr<Invoice>,
          String
        > {
  SingleInvoiceNotifierFamily._()
    : super(
        retry: retry,
        name: r'singleInvoiceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SingleInvoiceNotifierProvider call(String invoiceId) =>
      SingleInvoiceNotifierProvider._(argument: invoiceId, from: this);

  @override
  String toString() => r'singleInvoiceProvider';
}

abstract class _$SingleInvoiceNotifier extends $AsyncNotifier<Invoice> {
  late final _$args = ref.$arg as String;
  String get invoiceId => _$args;

  FutureOr<Invoice> build(String invoiceId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Invoice>, Invoice>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Invoice>, Invoice>,
              AsyncValue<Invoice>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
