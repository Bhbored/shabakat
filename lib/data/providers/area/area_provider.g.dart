// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AreaNotifier)
final areaProvider = AreaNotifierProvider._();

final class AreaNotifierProvider
    extends $AsyncNotifierProvider<AreaNotifier, List<Area>> {
  AreaNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'areaProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$areaNotifierHash();

  @$internal
  @override
  AreaNotifier create() => AreaNotifier();
}

String _$areaNotifierHash() => r'26edb04c7f0fe79c25480e61b17110101da08125';

abstract class _$AreaNotifier extends $AsyncNotifier<List<Area>> {
  FutureOr<List<Area>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Area>>, List<Area>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Area>>, List<Area>>,
              AsyncValue<List<Area>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
