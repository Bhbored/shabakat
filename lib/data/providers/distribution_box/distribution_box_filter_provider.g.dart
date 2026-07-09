// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distribution_box_filter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DistributionBoxFilterNotifier)
final distributionBoxFilterProvider = DistributionBoxFilterNotifierProvider._();

final class DistributionBoxFilterNotifierProvider
    extends
        $NotifierProvider<
          DistributionBoxFilterNotifier,
          DistributionBoxFilterRequest
        > {
  DistributionBoxFilterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'distributionBoxFilterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$distributionBoxFilterNotifierHash();

  @$internal
  @override
  DistributionBoxFilterNotifier create() => DistributionBoxFilterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DistributionBoxFilterRequest value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DistributionBoxFilterRequest>(value),
    );
  }
}

String _$distributionBoxFilterNotifierHash() =>
    r'1a9359b17250eee78be614ca4732b238dcfd862e';

abstract class _$DistributionBoxFilterNotifier
    extends $Notifier<DistributionBoxFilterRequest> {
  DistributionBoxFilterRequest build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<DistributionBoxFilterRequest, DistributionBoxFilterRequest>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                DistributionBoxFilterRequest,
                DistributionBoxFilterRequest
              >,
              DistributionBoxFilterRequest,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
