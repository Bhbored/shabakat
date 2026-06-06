// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_filter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CustomerFilterNotifier)
final customerFilterProvider = CustomerFilterNotifierProvider._();

final class CustomerFilterNotifierProvider
    extends $NotifierProvider<CustomerFilterNotifier, CustomerFilterRequest> {
  CustomerFilterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'customerFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customerFilterNotifierHash();

  @$internal
  @override
  CustomerFilterNotifier create() => CustomerFilterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CustomerFilterRequest value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CustomerFilterRequest>(value),
    );
  }
}

String _$customerFilterNotifierHash() =>
    r'2d5076154be44d451cb0c683f9cdf5bcc7e8f1f9';

abstract class _$CustomerFilterNotifier
    extends $Notifier<CustomerFilterRequest> {
  CustomerFilterRequest build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CustomerFilterRequest, CustomerFilterRequest>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CustomerFilterRequest, CustomerFilterRequest>,
              CustomerFilterRequest,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
