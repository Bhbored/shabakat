// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(areaService)
final areaServiceProvider = AreaServiceProvider._();

final class AreaServiceProvider
    extends $FunctionalProvider<AreaService, AreaService, AreaService>
    with $Provider<AreaService> {
  AreaServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'areaServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$areaServiceHash();

  @$internal
  @override
  $ProviderElement<AreaService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AreaService create(Ref ref) {
    return areaService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AreaService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AreaService>(value),
    );
  }
}

String _$areaServiceHash() => r'8b134ec561520bba5d10ba2dbc8bb76dc2d04a37';
