// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_breakdown_params_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(invoiceBreakdownParams)
final invoiceBreakdownParamsProvider = InvoiceBreakdownParamsFamily._();

final class InvoiceBreakdownParamsProvider
    extends
        $FunctionalProvider<
          AsyncValue<InvoiceBreakdownParams>,
          InvoiceBreakdownParams,
          FutureOr<InvoiceBreakdownParams>
        >
    with
        $FutureModifier<InvoiceBreakdownParams>,
        $FutureProvider<InvoiceBreakdownParams> {
  InvoiceBreakdownParamsProvider._({
    required InvoiceBreakdownParamsFamily super.from,
    required String super.argument,
  }) : super(
         retry: retry,
         name: r'invoiceBreakdownParamsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$invoiceBreakdownParamsHash();

  @override
  String toString() {
    return r'invoiceBreakdownParamsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<InvoiceBreakdownParams> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<InvoiceBreakdownParams> create(Ref ref) {
    final argument = this.argument as String;
    return invoiceBreakdownParams(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is InvoiceBreakdownParamsProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$invoiceBreakdownParamsHash() =>
    r'db0dc4fe4f0bdc6341bb72a4a3efbe458d49202b';

final class InvoiceBreakdownParamsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<InvoiceBreakdownParams>, String> {
  InvoiceBreakdownParamsFamily._()
    : super(
        retry: retry,
        name: r'invoiceBreakdownParamsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InvoiceBreakdownParamsProvider call(String invoiceId) =>
      InvoiceBreakdownParamsProvider._(argument: invoiceId, from: this);

  @override
  String toString() => r'invoiceBreakdownParamsProvider';
}
