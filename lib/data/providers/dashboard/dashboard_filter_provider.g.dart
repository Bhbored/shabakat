// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_filter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DashboardFilterNotifier)
final dashboardFilterProvider = DashboardFilterNotifierProvider._();

final class DashboardFilterNotifierProvider
    extends $NotifierProvider<DashboardFilterNotifier, DashboardFilterRequest> {
  DashboardFilterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'dashboardFilterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardFilterNotifierHash();

  @$internal
  @override
  DashboardFilterNotifier create() => DashboardFilterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DashboardFilterRequest value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashboardFilterRequest>(value),
    );
  }
}

String _$dashboardFilterNotifierHash() =>
    r'8fd26f4937f84629e4497f63e1b4e516254f1246';

abstract class _$DashboardFilterNotifier
    extends $Notifier<DashboardFilterRequest> {
  DashboardFilterRequest build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<DashboardFilterRequest, DashboardFilterRequest>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DashboardFilterRequest, DashboardFilterRequest>,
              DashboardFilterRequest,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
