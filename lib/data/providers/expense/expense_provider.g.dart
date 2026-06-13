// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ExpenseNotifier)
final expenseProvider = ExpenseNotifierProvider._();

final class ExpenseNotifierProvider
    extends $AsyncNotifierProvider<ExpenseNotifier, List<Expenses>> {
  ExpenseNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'expenseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expenseNotifierHash();

  @$internal
  @override
  ExpenseNotifier create() => ExpenseNotifier();
}

String _$expenseNotifierHash() => r'5c20e546a7a424d473ab588a54c5d879623e67b3';

abstract class _$ExpenseNotifier extends $AsyncNotifier<List<Expenses>> {
  FutureOr<List<Expenses>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Expenses>>, List<Expenses>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Expenses>>, List<Expenses>>,
              AsyncValue<List<Expenses>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
