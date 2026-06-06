// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CompanyNotifier)
final companyProvider = CompanyNotifierProvider._();

final class CompanyNotifierProvider
    extends $AsyncNotifierProvider<CompanyNotifier, CompanyPreferences> {
  CompanyNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'companyProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$companyNotifierHash();

  @$internal
  @override
  CompanyNotifier create() => CompanyNotifier();
}

String _$companyNotifierHash() => r'bf19a57fc694c82d34216289ad3f3e2438b89b96';

abstract class _$CompanyNotifier extends $AsyncNotifier<CompanyPreferences> {
  FutureOr<CompanyPreferences> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<CompanyPreferences>, CompanyPreferences>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CompanyPreferences>, CompanyPreferences>,
              AsyncValue<CompanyPreferences>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
