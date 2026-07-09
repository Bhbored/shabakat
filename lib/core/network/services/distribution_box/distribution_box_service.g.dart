// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distribution_box_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(distributionBoxService)
final distributionBoxServiceProvider = DistributionBoxServiceProvider._();

final class DistributionBoxServiceProvider
    extends
        $FunctionalProvider<
          DistributionBoxService,
          DistributionBoxService,
          DistributionBoxService
        >
    with $Provider<DistributionBoxService> {
  DistributionBoxServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'distributionBoxServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$distributionBoxServiceHash();

  @$internal
  @override
  $ProviderElement<DistributionBoxService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DistributionBoxService create(Ref ref) {
    return distributionBoxService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DistributionBoxService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DistributionBoxService>(value),
    );
  }
}

String _$distributionBoxServiceHash() =>
    r'0292828a1142c9eba24479ed8811e9023ad1579d';
