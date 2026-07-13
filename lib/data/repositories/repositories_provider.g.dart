// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositories_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appDatabase)
final appDatabaseProvider = AppDatabaseProvider._();

final class AppDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  AppDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'appDatabaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return appDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$appDatabaseHash() => r'6a99b538ba33a1280a8a3f26d9dc443bdfaba89b';

@ProviderFor(areaRepo)
final areaRepoProvider = AreaRepoProvider._();

final class AreaRepoProvider
    extends $FunctionalProvider<AreaRepo, AreaRepo, AreaRepo>
    with $Provider<AreaRepo> {
  AreaRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'areaRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$areaRepoHash();

  @$internal
  @override
  $ProviderElement<AreaRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AreaRepo create(Ref ref) {
    return areaRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AreaRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AreaRepo>(value),
    );
  }
}

String _$areaRepoHash() => r'51465e296af77e9389fe690d5d95d2f168ab931d';

@ProviderFor(customerRepo)
final customerRepoProvider = CustomerRepoProvider._();

final class CustomerRepoProvider
    extends $FunctionalProvider<CustomerRepo, CustomerRepo, CustomerRepo>
    with $Provider<CustomerRepo> {
  CustomerRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'customerRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customerRepoHash();

  @$internal
  @override
  $ProviderElement<CustomerRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CustomerRepo create(Ref ref) {
    return customerRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CustomerRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CustomerRepo>(value),
    );
  }
}

String _$customerRepoHash() => r'38ab92850e38de50707216df9238252c89690f92';

@ProviderFor(distributionBoxRepo)
final distributionBoxRepoProvider = DistributionBoxRepoProvider._();

final class DistributionBoxRepoProvider
    extends
        $FunctionalProvider<
          DistributionBoxRepo,
          DistributionBoxRepo,
          DistributionBoxRepo
        >
    with $Provider<DistributionBoxRepo> {
  DistributionBoxRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'distributionBoxRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$distributionBoxRepoHash();

  @$internal
  @override
  $ProviderElement<DistributionBoxRepo> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DistributionBoxRepo create(Ref ref) {
    return distributionBoxRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DistributionBoxRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DistributionBoxRepo>(value),
    );
  }
}

String _$distributionBoxRepoHash() =>
    r'cffddbe8d39c371e36bcb319591013b2942d6a86';

@ProviderFor(expenseRepo)
final expenseRepoProvider = ExpenseRepoProvider._();

final class ExpenseRepoProvider
    extends $FunctionalProvider<ExpenseRepo, ExpenseRepo, ExpenseRepo>
    with $Provider<ExpenseRepo> {
  ExpenseRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'expenseRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expenseRepoHash();

  @$internal
  @override
  $ProviderElement<ExpenseRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ExpenseRepo create(Ref ref) {
    return expenseRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExpenseRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExpenseRepo>(value),
    );
  }
}

String _$expenseRepoHash() => r'2a61b6af913829dec877d90c2ce1e0e45ed5612a';

@ProviderFor(invoiceRepo)
final invoiceRepoProvider = InvoiceRepoProvider._();

final class InvoiceRepoProvider
    extends $FunctionalProvider<InvoiceRepo, InvoiceRepo, InvoiceRepo>
    with $Provider<InvoiceRepo> {
  InvoiceRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'invoiceRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$invoiceRepoHash();

  @$internal
  @override
  $ProviderElement<InvoiceRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  InvoiceRepo create(Ref ref) {
    return invoiceRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InvoiceRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InvoiceRepo>(value),
    );
  }
}

String _$invoiceRepoHash() => r'ed55478b6f73fceac332f3c3525d374afd82abae';

@ProviderFor(meterReadingRepo)
final meterReadingRepoProvider = MeterReadingRepoProvider._();

final class MeterReadingRepoProvider
    extends
        $FunctionalProvider<
          MeterReadingRepo,
          MeterReadingRepo,
          MeterReadingRepo
        >
    with $Provider<MeterReadingRepo> {
  MeterReadingRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'meterReadingRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$meterReadingRepoHash();

  @$internal
  @override
  $ProviderElement<MeterReadingRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MeterReadingRepo create(Ref ref) {
    return meterReadingRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MeterReadingRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MeterReadingRepo>(value),
    );
  }
}

String _$meterReadingRepoHash() => r'0b5601445d7b42a12d02b5260f42e6b55ac38725';
