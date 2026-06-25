// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_selection_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CustomerSelectionNotifier)
final customerSelectionProvider = CustomerSelectionNotifierProvider._();

final class CustomerSelectionNotifierProvider
    extends $NotifierProvider<CustomerSelectionNotifier, CustomerSelection> {
  CustomerSelectionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'customerSelectionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customerSelectionNotifierHash();

  @$internal
  @override
  CustomerSelectionNotifier create() => CustomerSelectionNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CustomerSelection value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CustomerSelection>(value),
    );
  }
}

String _$customerSelectionNotifierHash() =>
    r'45340511ade06eb2455c02837bc83cdfd0e6e70d';

abstract class _$CustomerSelectionNotifier
    extends $Notifier<CustomerSelection> {
  CustomerSelection build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CustomerSelection, CustomerSelection>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CustomerSelection, CustomerSelection>,
              CustomerSelection,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
