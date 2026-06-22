// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_expense_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SingleExpenseNotifier)
final singleExpenseProvider = SingleExpenseNotifierFamily._();

final class SingleExpenseNotifierProvider
    extends $AsyncNotifierProvider<SingleExpenseNotifier, Expense> {
  SingleExpenseNotifierProvider._({
    required SingleExpenseNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: retry,
         name: r'singleExpenseProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$singleExpenseNotifierHash();

  @override
  String toString() {
    return r'singleExpenseProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SingleExpenseNotifier create() => SingleExpenseNotifier();

  @override
  bool operator ==(Object other) {
    return other is SingleExpenseNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$singleExpenseNotifierHash() =>
    r'4bcc189fc025b9e090e32e06685d4b93a1f70438';

final class SingleExpenseNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          SingleExpenseNotifier,
          AsyncValue<Expense>,
          Expense,
          FutureOr<Expense>,
          String
        > {
  SingleExpenseNotifierFamily._()
    : super(
        retry: retry,
        name: r'singleExpenseProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SingleExpenseNotifierProvider call(String expenseId) =>
      SingleExpenseNotifierProvider._(argument: expenseId, from: this);

  @override
  String toString() => r'singleExpenseProvider';
}

abstract class _$SingleExpenseNotifier extends $AsyncNotifier<Expense> {
  late final _$args = ref.$arg as String;
  String get expenseId => _$args;

  FutureOr<Expense> build(String expenseId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Expense>, Expense>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Expense>, Expense>,
              AsyncValue<Expense>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
