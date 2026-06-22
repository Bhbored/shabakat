// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_filter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ExpenseFilterNotifier)
final expenseFilterProvider = ExpenseFilterNotifierProvider._();

final class ExpenseFilterNotifierProvider
    extends $NotifierProvider<ExpenseFilterNotifier, ExpenseFilterRequest> {
  ExpenseFilterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'expenseFilterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expenseFilterNotifierHash();

  @$internal
  @override
  ExpenseFilterNotifier create() => ExpenseFilterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExpenseFilterRequest value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExpenseFilterRequest>(value),
    );
  }
}

String _$expenseFilterNotifierHash() =>
    r'7c7e75cbcdc2ee6dc833869674e7703d540369df';

abstract class _$ExpenseFilterNotifier extends $Notifier<ExpenseFilterRequest> {
  ExpenseFilterRequest build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ExpenseFilterRequest, ExpenseFilterRequest>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ExpenseFilterRequest, ExpenseFilterRequest>,
              ExpenseFilterRequest,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
