// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dashboardService)
final dashboardServiceProvider = DashboardServiceProvider._();

final class DashboardServiceProvider
    extends
        $FunctionalProvider<
          DashboardService,
          DashboardService,
          DashboardService
        >
    with $Provider<DashboardService> {
  DashboardServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'dashboardServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardServiceHash();

  @$internal
  @override
  $ProviderElement<DashboardService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DashboardService create(Ref ref) {
    return dashboardService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DashboardService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashboardService>(value),
    );
  }
}

String _$dashboardServiceHash() => r'c873a98e22caf48a05c24db93b9c05dc6ced0e3b';
