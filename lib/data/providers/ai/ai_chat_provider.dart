import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/services/ai/ai_service.dart';

part 'ai_chat_provider.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: false, retry: retry)
Stream<String> aiChat(Ref ref, String prompt, int nonce) async* {
  final trimmedPrompt = prompt.trim();
  if (trimmedPrompt.isEmpty) return;

  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);

  var accumulated = '';
  await for (final chunk in ref.read(aiServiceProvider).streamChat(
    prompt: trimmedPrompt,
    cancelToken: cancelToken,
  )) {
    accumulated += chunk;
    yield accumulated;
  }
}
