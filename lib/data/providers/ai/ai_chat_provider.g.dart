// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_chat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(aiChat)
final aiChatProvider = AiChatFamily._();

final class AiChatProvider
    extends $FunctionalProvider<AsyncValue<String>, String, Stream<String>>
    with $FutureModifier<String>, $StreamProvider<String> {
  AiChatProvider._({
    required AiChatFamily super.from,
    required (String, int) super.argument,
  }) : super(
         retry: retry,
         name: r'aiChatProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$aiChatHash();

  @override
  String toString() {
    return r'aiChatProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<String> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<String> create(Ref ref) {
    final argument = this.argument as (String, int);
    return aiChat(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is AiChatProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$aiChatHash() => r'093fb24478ddc71b817b0a01c0a13297ada17687';

final class AiChatFamily extends $Family
    with $FunctionalFamilyOverride<Stream<String>, (String, int)> {
  AiChatFamily._()
    : super(
        retry: retry,
        name: r'aiChatProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AiChatProvider call(String prompt, int nonce) =>
      AiChatProvider._(argument: (prompt, nonce), from: this);

  @override
  String toString() => r'aiChatProvider';
}
