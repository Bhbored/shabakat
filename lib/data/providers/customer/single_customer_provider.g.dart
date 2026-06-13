// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_customer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SingleCustomer)
final singleCustomerProvider = SingleCustomerFamily._();

final class SingleCustomerProvider
    extends $AsyncNotifierProvider<SingleCustomer, Customer> {
  SingleCustomerProvider._({
    required SingleCustomerFamily super.from,
    required String super.argument,
  }) : super(
         retry: retry,
         name: r'singleCustomerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$singleCustomerHash();

  @override
  String toString() {
    return r'singleCustomerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SingleCustomer create() => SingleCustomer();

  @override
  bool operator ==(Object other) {
    return other is SingleCustomerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$singleCustomerHash() => r'1d20aacc91396ebbbbc4e5ace0bba87167e5a0ae';

final class SingleCustomerFamily extends $Family
    with
        $ClassFamilyOverride<
          SingleCustomer,
          AsyncValue<Customer>,
          Customer,
          FutureOr<Customer>,
          String
        > {
  SingleCustomerFamily._()
    : super(
        retry: retry,
        name: r'singleCustomerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SingleCustomerProvider call(String customerId) =>
      SingleCustomerProvider._(argument: customerId, from: this);

  @override
  String toString() => r'singleCustomerProvider';
}

abstract class _$SingleCustomer extends $AsyncNotifier<Customer> {
  late final _$args = ref.$arg as String;
  String get customerId => _$args;

  FutureOr<Customer> build(String customerId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Customer>, Customer>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Customer>, Customer>,
              AsyncValue<Customer>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
