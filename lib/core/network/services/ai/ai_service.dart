import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/network/client/dio_client.dart';
import 'package:shabakat/core/network/configs/http_methods.dart';
import 'package:shabakat/core/network/executor/api_executor.dart';
import 'package:shabakat/core/network/request/api_request.dart';

part 'ai_service.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
AiService aiService(Ref ref) {
  final DioClient dioClient = ref.read(dioClientProvider(null, endpoint: ''));
  final apiExecutor = ref.read(apiExecutorProvider(dioClient.dio));
  return AiService(apiExecutor);
}

class AiService {
  AiService(this._apiExecutor);

  late final ApiExecutor _apiExecutor;
  final _logger = Logger();

  static const _doneSentinel = '[DONE]';
  static const _streamTimeout = Duration(minutes: 5);

  Stream<String> streamChat({
    String? prompt,
    String? audioFilePath,
    CancelToken? cancelToken,
  }) async* {
    final formData = FormData();
    if (prompt != null && prompt.trim().isNotEmpty) {
      formData.fields.add(MapEntry('prompt', prompt.trim()));
    }
    if (audioFilePath != null) {
      formData.files.add(
        MapEntry(
          'audioFile',
          await MultipartFile.fromFile(
            audioFilePath,
            filename: p.basename(audioFilePath),
          ),
        ),
      );
    }

    final response = await _apiExecutor.execute<ResponseBody>(
      ApiRequest(
        path: 'chat/stream',
        method: HttpMethod.post,
        data: formData,
        headers: {
          'Accept': 'text/event-stream',
          'Cache-Control': 'no-cache',
        },
        cancelToken: cancelToken,
        options: Options(
          responseType: ResponseType.stream,
          receiveTimeout: _streamTimeout,
          sendTimeout: const Duration(seconds: 60),
        ),
      ),
    );

    final body = response.when(
      success: (data, statusCode, meta) {
        _logger.i('AI chat stream opened');
        return data;
      },
      failure: (error, statusCode) {
        _logger.e('Failed to open AI chat stream: ${error.toString()}');
        throw error;
      },
    );

    try {
      yield* _parseSse(body.stream);
      _logger.i('AI chat stream completed');
    } catch (e, stackTrace) {
      _logger.e(
        'AI chat stream interrupted: $e',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Stream<String> _parseSse(Stream<List<int>> byteStream) async* {
    final pending = StringBuffer();

    try {
      await for (final bytes in byteStream) {
        pending.write(utf8.decode(bytes, allowMalformed: true));
        var buffer = pending.toString();

        while (true) {
          final separatorIndex = buffer.indexOf('\n\n');
          if (separatorIndex < 0) break;

          final event = buffer.substring(0, separatorIndex);
          buffer = buffer.substring(separatorIndex + 2);

          for (final rawLine in event.split('\n')) {
            final line = rawLine.endsWith('\r')
                ? rawLine.substring(0, rawLine.length - 1)
                : rawLine;
            if (!line.startsWith('data:')) continue;

            var payload = line.substring(5);
            if (payload.startsWith(' ')) {
              payload = payload.substring(1);
            }

            if (payload == _doneSentinel) return;
            if (payload.isEmpty) continue;

            final text = _textFromPayload(payload);
            if (text == null) continue;
            if (text == _doneSentinel) return;
            if (text.isEmpty) continue;
            yield text;
          }
        }

        pending
          ..clear()
          ..write(buffer);
      }
    } catch (e, stackTrace) {
      _logger.e('SSE parse stream error: $e', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  String? _textFromPayload(String payload) {
    try {
      final decoded = jsonDecode(payload);
      if (decoded is! Map<String, dynamic>) return null;
      final text = decoded['text'];
      return text is String ? text : null;
    } catch (e, stackTrace) {
      _logger.w(
        'Skipping invalid AI SSE payload: $payload',
        error: e,
        stackTrace: stackTrace,
      );
      return null;
    }
  }
}
