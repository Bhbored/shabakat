// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distribution_box_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DistributionBoxNotifier)
final distributionBoxProvider = DistributionBoxNotifierProvider._();

final class DistributionBoxNotifierProvider
    extends
        $AsyncNotifierProvider<DistributionBoxNotifier, List<DistributionBox>> {
  DistributionBoxNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'distributionBoxProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$distributionBoxNotifierHash();

  @$internal
  @override
  DistributionBoxNotifier create() => DistributionBoxNotifier();
}

String _$distributionBoxNotifierHash() =>
    r'dd098824bfca6754d1e7db293ac85088725eebcc';

abstract class _$DistributionBoxNotifier
    extends $AsyncNotifier<List<DistributionBox>> {
  FutureOr<List<DistributionBox>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<DistributionBox>>, List<DistributionBox>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<DistributionBox>>,
                List<DistributionBox>
              >,
              AsyncValue<List<DistributionBox>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
