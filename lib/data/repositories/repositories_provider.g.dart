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
        isAutoDispose: false,
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

String _$appDatabaseHash() => r'1275c06d656588fdb57e5e7958cf4f272f1878e7';

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
        isAutoDispose: false,
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

String _$areaRepoHash() => r'550f8bcd7b8e64a2cf0535d0d7f67c5b94b5c28c';

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
        isAutoDispose: false,
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

String _$customerRepoHash() => r'8e3082b5e01581bb81f1bc13d33ba1eeff29b2d8';

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
        isAutoDispose: false,
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
    r'4ce3d7d6b3392541270fca05363a4bf1171992c5';

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
        isAutoDispose: false,
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

String _$expenseRepoHash() => r'8a316462c2ce0c57878cc7ff35a6684f4a531072';

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
        isAutoDispose: false,
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

String _$invoiceRepoHash() => r'b05d84a97c700dd29f79746190d1c0323af8da02';

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
        isAutoDispose: false,
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

String _$meterReadingRepoHash() => r'f3c05de93d84f52235b62de1496bbb576d653257';
