// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_syncer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(offlineSyncer)
final offlineSyncerProvider = OfflineSyncerProvider._();

final class OfflineSyncerProvider
    extends $FunctionalProvider<OfflineSyncer, OfflineSyncer, OfflineSyncer>
    with $Provider<OfflineSyncer> {
  OfflineSyncerProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'offlineSyncerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$offlineSyncerHash();

  @$internal
  @override
  $ProviderElement<OfflineSyncer> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  OfflineSyncer create(Ref ref) {
    return offlineSyncer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OfflineSyncer value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OfflineSyncer>(value),
    );
  }
}

String _$offlineSyncerHash() => r'1ddb4a3ee6d08d5d193a112cf93b74cf1d569ab6';
