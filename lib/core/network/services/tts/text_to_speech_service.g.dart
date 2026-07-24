// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_to_speech_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(textToSpeechService)
final textToSpeechServiceProvider = TextToSpeechServiceProvider._();

final class TextToSpeechServiceProvider
    extends
        $FunctionalProvider<
          TextToSpeechService,
          TextToSpeechService,
          TextToSpeechService
        >
    with $Provider<TextToSpeechService> {
  TextToSpeechServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'textToSpeechServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$textToSpeechServiceHash();

  @$internal
  @override
  $ProviderElement<TextToSpeechService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TextToSpeechService create(Ref ref) {
    return textToSpeechService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextToSpeechService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextToSpeechService>(value),
    );
  }
}

String _$textToSpeechServiceHash() =>
    r'0d72ddf0b9649cc609f61d2455f1b3cfcce061c4';
