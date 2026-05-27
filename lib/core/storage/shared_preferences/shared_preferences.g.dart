// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_preferences.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sharedPreferencesHandler)
final sharedPreferencesHandlerProvider = SharedPreferencesHandlerProvider._();

final class SharedPreferencesHandlerProvider
    extends
        $FunctionalProvider<
          SharedPreferencesHandler,
          SharedPreferencesHandler,
          SharedPreferencesHandler
        >
    with $Provider<SharedPreferencesHandler> {
  SharedPreferencesHandlerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPreferencesHandlerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPreferencesHandlerHash();

  @$internal
  @override
  $ProviderElement<SharedPreferencesHandler> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SharedPreferencesHandler create(Ref ref) {
    return sharedPreferencesHandler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferencesHandler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferencesHandler>(value),
    );
  }
}

String _$sharedPreferencesHandlerHash() =>
    r'cfdb0d0dc439f2a556fe9280ec015f12853a623c';
