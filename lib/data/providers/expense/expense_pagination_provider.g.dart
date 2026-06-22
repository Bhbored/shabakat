// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_pagination_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ExpensePaginationNotifier)
final expensePaginationProvider = ExpensePaginationNotifierProvider._();

final class ExpensePaginationNotifierProvider
    extends $NotifierProvider<ExpensePaginationNotifier, ExpensePagination> {
  ExpensePaginationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'expensePaginationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expensePaginationNotifierHash();

  @$internal
  @override
  ExpensePaginationNotifier create() => ExpensePaginationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExpensePagination value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExpensePagination>(value),
    );
  }
}

String _$expensePaginationNotifierHash() =>
    r'7cd4c0f23271378894980d360fa1252da3fcc197';

abstract class _$ExpensePaginationNotifier
    extends $Notifier<ExpensePagination> {
  ExpensePagination build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ExpensePagination, ExpensePagination>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ExpensePagination, ExpensePagination>,
              ExpensePagination,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
