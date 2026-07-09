// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distribution_box_pagination_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DistributionBoxPaginationNotifier)
final distributionBoxPaginationProvider =
    DistributionBoxPaginationNotifierProvider._();

final class DistributionBoxPaginationNotifierProvider
    extends
        $NotifierProvider<
          DistributionBoxPaginationNotifier,
          DistributionBoxPagination
        > {
  DistributionBoxPaginationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'distributionBoxPaginationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$distributionBoxPaginationNotifierHash();

  @$internal
  @override
  DistributionBoxPaginationNotifier create() =>
      DistributionBoxPaginationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DistributionBoxPagination value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DistributionBoxPagination>(value),
    );
  }
}

String _$distributionBoxPaginationNotifierHash() =>
    r'732ccdc53bf09b4648fa9ad3a2eaf2401d0139e0';

abstract class _$DistributionBoxPaginationNotifier
    extends $Notifier<DistributionBoxPagination> {
  DistributionBoxPagination build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<DistributionBoxPagination, DistributionBoxPagination>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DistributionBoxPagination, DistributionBoxPagination>,
              DistributionBoxPagination,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
