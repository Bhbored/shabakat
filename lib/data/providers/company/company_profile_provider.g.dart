// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CompanyProfileUploadNotifier)
final companyProfileUploadProvider = CompanyProfileUploadNotifierProvider._();

final class CompanyProfileUploadNotifierProvider
    extends
        $NotifierProvider<
          CompanyProfileUploadNotifier,
          CompanyProfileUploadState
        > {
  CompanyProfileUploadNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'companyProfileUploadProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$companyProfileUploadNotifierHash();

  @$internal
  @override
  CompanyProfileUploadNotifier create() => CompanyProfileUploadNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CompanyProfileUploadState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CompanyProfileUploadState>(value),
    );
  }
}

String _$companyProfileUploadNotifierHash() =>
    r'bb04fedbbc19e00be08aaeefd17f73146327ebe5';

abstract class _$CompanyProfileUploadNotifier
    extends $Notifier<CompanyProfileUploadState> {
  CompanyProfileUploadState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<CompanyProfileUploadState, CompanyProfileUploadState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CompanyProfileUploadState, CompanyProfileUploadState>,
              CompanyProfileUploadState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(CompanyProfileNotifier)
final companyProfileProvider = CompanyProfileNotifierProvider._();

final class CompanyProfileNotifierProvider
    extends $AsyncNotifierProvider<CompanyProfileNotifier, GetProfileResponse> {
  CompanyProfileNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'companyProfileProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$companyProfileNotifierHash();

  @$internal
  @override
  CompanyProfileNotifier create() => CompanyProfileNotifier();
}

String _$companyProfileNotifierHash() =>
    r'83ceedccfd7857dd4ee901d59cecbae8a9a144f9';

abstract class _$CompanyProfileNotifier
    extends $AsyncNotifier<GetProfileResponse> {
  FutureOr<GetProfileResponse> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<GetProfileResponse>, GetProfileResponse>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<GetProfileResponse>, GetProfileResponse>,
              AsyncValue<GetProfileResponse>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
