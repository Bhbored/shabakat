// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(companyService)
final companyServiceProvider = CompanyServiceProvider._();

final class CompanyServiceProvider
    extends $FunctionalProvider<CompanyService, CompanyService, CompanyService>
    with $Provider<CompanyService> {
  CompanyServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'companyServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$companyServiceHash();

  @$internal
  @override
  $ProviderElement<CompanyService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CompanyService create(Ref ref) {
    return companyService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CompanyService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CompanyService>(value),
    );
  }
}

String _$companyServiceHash() => r'a53a45ab3afc8daf668eb1862020c7b5adf1d1b1';
