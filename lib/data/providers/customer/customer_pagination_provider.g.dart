// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_pagination_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CustomerPaginationNotifier)
final customerPaginationProvider = CustomerPaginationNotifierProvider._();

final class CustomerPaginationNotifierProvider
    extends $NotifierProvider<CustomerPaginationNotifier, CustomerPagination> {
  CustomerPaginationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'customerPaginationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customerPaginationNotifierHash();

  @$internal
  @override
  CustomerPaginationNotifier create() => CustomerPaginationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CustomerPagination value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CustomerPagination>(value),
    );
  }
}

String _$customerPaginationNotifierHash() =>
    r'552ab6561ed27d9de9df2d500deb4e3c2b584f0c';

abstract class _$CustomerPaginationNotifier
    extends $Notifier<CustomerPagination> {
  CustomerPagination build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CustomerPagination, CustomerPagination>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CustomerPagination, CustomerPagination>,
              CustomerPagination,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
