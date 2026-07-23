// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temp_audio_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tempAudioStore)
final tempAudioStoreProvider = TempAudioStoreProvider._();

final class TempAudioStoreProvider
    extends $FunctionalProvider<TempAudioStore, TempAudioStore, TempAudioStore>
    with $Provider<TempAudioStore> {
  TempAudioStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'tempAudioStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tempAudioStoreHash();

  @$internal
  @override
  $ProviderElement<TempAudioStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TempAudioStore create(Ref ref) {
    return tempAudioStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TempAudioStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TempAudioStore>(value),
    );
  }
}

String _$tempAudioStoreHash() => r'681d4152783cd3fd82bfcbc0b5cb0614826def6c';
