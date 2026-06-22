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
    extends $AsyncNotifierProvider<ExpenseNotifier, List<Expense>> {
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

String _$expenseNotifierHash() => r'35f45f07da894c1e25868fc3dfa24e38b0a669b2';

abstract class _$ExpenseNotifier extends $AsyncNotifier<List<Expense>> {
  FutureOr<List<Expense>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Expense>>, List<Expense>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Expense>>, List<Expense>>,
              AsyncValue<List<Expense>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
