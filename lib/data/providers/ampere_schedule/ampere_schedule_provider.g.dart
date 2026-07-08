// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ampere_schedule_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AmpereScheduleNotifier)
final ampereScheduleProvider = AmpereScheduleNotifierProvider._();

final class AmpereScheduleNotifierProvider
    extends
        $AsyncNotifierProvider<AmpereScheduleNotifier, List<AmpereSchedule>> {
  AmpereScheduleNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'ampereScheduleProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ampereScheduleNotifierHash();

  @$internal
  @override
  AmpereScheduleNotifier create() => AmpereScheduleNotifier();
}

String _$ampereScheduleNotifierHash() =>
    r'2c2abeab0a4ebd8e2bf97bfad334758e0428eaab';

abstract class _$AmpereScheduleNotifier
    extends $AsyncNotifier<List<AmpereSchedule>> {
  FutureOr<List<AmpereSchedule>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<AmpereSchedule>>, List<AmpereSchedule>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<AmpereSchedule>>,
                List<AmpereSchedule>
              >,
              AsyncValue<List<AmpereSchedule>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
