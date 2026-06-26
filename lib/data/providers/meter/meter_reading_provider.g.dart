// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meter_reading_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MeterReadingNotifier)
final meterReadingProvider = MeterReadingNotifierFamily._();

final class MeterReadingNotifierProvider
    extends $AsyncNotifierProvider<MeterReadingNotifier, List<MeterReading>> {
  MeterReadingNotifierProvider._({
    required MeterReadingNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: retry,
         name: r'meterReadingProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$meterReadingNotifierHash();

  @override
  String toString() {
    return r'meterReadingProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MeterReadingNotifier create() => MeterReadingNotifier();

  @override
  bool operator ==(Object other) {
    return other is MeterReadingNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$meterReadingNotifierHash() =>
    r'13d39586123cd1500695275901f27fb6506f618b';

final class MeterReadingNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          MeterReadingNotifier,
          AsyncValue<List<MeterReading>>,
          List<MeterReading>,
          FutureOr<List<MeterReading>>,
          String
        > {
  MeterReadingNotifierFamily._()
    : super(
        retry: retry,
        name: r'meterReadingProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MeterReadingNotifierProvider call(String customerId) =>
      MeterReadingNotifierProvider._(argument: customerId, from: this);

  @override
  String toString() => r'meterReadingProvider';
}

abstract class _$MeterReadingNotifier
    extends $AsyncNotifier<List<MeterReading>> {
  late final _$args = ref.$arg as String;
  String get customerId => _$args;

  FutureOr<List<MeterReading>> build(String customerId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<MeterReading>>, List<MeterReading>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<MeterReading>>, List<MeterReading>>,
              AsyncValue<List<MeterReading>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
