import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/storage/shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

part 'temp_audio_store.g.dart';

Duration? retry(int _, Object _) => null;

@Riverpod(keepAlive: true, retry: retry)
TempAudioStore tempAudioStore(Ref ref) {
  return TempAudioStore(ref.read(sharedPreferencesHandlerProvider));
}

class TempAudioStore {
  TempAudioStore(this._prefs);

  static const _prefsKey = 'ai_audio_paths';
  static const _folderName = 'ai_audio';

  final SharedPreferencesHandler _prefs;
  final _logger = Logger();
  final _uuid = const Uuid();

  Future<Directory> _audioDir() async {
    final temp = await getTemporaryDirectory();
    final dir = Directory(p.join(temp.path, _folderName));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  Future<String> newRecordingPath() async {
    final dir = await _audioDir();
    return p.join(dir.path, '${_uuid.v4()}.m4a');
  }

  Future<List<String>> _readPaths() async {
    final raw = await _prefs.getString(_prefsKey);
    if (raw == null || raw.isEmpty) return [];
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return [];
      return decoded.whereType<String>().toList();
    } catch (e, stackTrace) {
      _logger.w(
        'Failed to parse $_prefsKey',
        error: e,
        stackTrace: stackTrace,
      );
      return [];
    }
  }

  Future<void> _writePaths(List<String> paths) async {
    await _prefs.setString(_prefsKey, jsonEncode(paths));
  }

  Future<void> track(String path) async {
    final paths = await _readPaths();
    if (!paths.contains(path)) {
      paths.add(path);
      await _writePaths(paths);
    }
  }

  Future<void> clear() async {
    final paths = await _readPaths();
    for (final path in paths) {
      try {
        final file = File(path);
        if (await file.exists()) {
          await file.delete();
        }
      } catch (e, stackTrace) {
        _logger.w(
          'Failed to delete audio file: $path',
          error: e,
          stackTrace: stackTrace,
        );
      }
    }

    try {
      final temp = await getTemporaryDirectory();
      final dir = Directory(p.join(temp.path, _folderName));
      if (await dir.exists()) {
        await dir.delete(recursive: true);
      }
    } catch (e, stackTrace) {
      _logger.w(
        'Failed to delete $_folderName directory',
        error: e,
        stackTrace: stackTrace,
      );
    }

    await _prefs.remove(_prefsKey);
    _logger.i('Cleared tracked AI audio files');
  }
}
