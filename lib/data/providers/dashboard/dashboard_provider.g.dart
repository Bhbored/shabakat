// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DashboardNotifier)
final dashboardProvider = DashboardNotifierProvider._();

final class DashboardNotifierProvider
    extends
        $AsyncNotifierProvider<DashboardNotifier, DashboardSummaryResponse> {
  DashboardNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'dashboardProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardNotifierHash();

  @$internal
  @override
  DashboardNotifier create() => DashboardNotifier();
}

String _$dashboardNotifierHash() => r'2c5454681af2bc327bf9739fa85fb75db004832a';

abstract class _$DashboardNotifier
    extends $AsyncNotifier<DashboardSummaryResponse> {
  FutureOr<DashboardSummaryResponse> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<DashboardSummaryResponse>,
              DashboardSummaryResponse
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<DashboardSummaryResponse>,
                DashboardSummaryResponse
              >,
              AsyncValue<DashboardSummaryResponse>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
