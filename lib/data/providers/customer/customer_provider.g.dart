// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CustomerNotifier)
final customerProvider = CustomerNotifierProvider._();

final class CustomerNotifierProvider
    extends $AsyncNotifierProvider<CustomerNotifier, List<Customer>> {
  CustomerNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'customerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customerNotifierHash();

  @$internal
  @override
  CustomerNotifier create() => CustomerNotifier();
}

String _$customerNotifierHash() => r'c7926e0ce68b4aa32a72ed61c1d3766aadbb3b8f';

abstract class _$CustomerNotifier extends $AsyncNotifier<List<Customer>> {
  FutureOr<List<Customer>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Customer>>, List<Customer>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Customer>>, List<Customer>>,
              AsyncValue<List<Customer>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
