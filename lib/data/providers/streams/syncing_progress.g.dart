// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syncing_progress.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(syncingProgress)
final syncingProgressProvider = SyncingProgressProvider._();

final class SyncingProgressProvider
    extends $FunctionalProvider<AsyncValue<double>, double, Stream<double>>
    with $FutureModifier<double>, $StreamProvider<double> {
  SyncingProgressProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncingProgressProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncingProgressHash();

  @$internal
  @override
  $StreamProviderElement<double> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<double> create(Ref ref) {
    return syncingProgress(ref);
  }
}

String _$syncingProgressHash() => r'3cae3b6b6ce42d50cf2584ba0a63ee67624b48d7';
