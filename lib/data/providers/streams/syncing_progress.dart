import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shabakat/core/utilities/offline_syncer.dart';

part 'syncing_progress.g.dart';

@Riverpod(keepAlive: false)
Stream<double> syncingProgress(Ref ref) {
  final syncer = ref.watch(offlineSyncerProvider);
  return syncer.progressStream;
}
