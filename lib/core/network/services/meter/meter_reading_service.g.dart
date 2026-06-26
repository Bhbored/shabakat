// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meter_reading_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(meterReadingService)
final meterReadingServiceProvider = MeterReadingServiceProvider._();

final class MeterReadingServiceProvider
    extends
        $FunctionalProvider<
          MeterReadingService,
          MeterReadingService,
          MeterReadingService
        >
    with $Provider<MeterReadingService> {
  MeterReadingServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'meterReadingServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$meterReadingServiceHash();

  @$internal
  @override
  $ProviderElement<MeterReadingService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MeterReadingService create(Ref ref) {
    return meterReadingService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MeterReadingService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MeterReadingService>(value),
    );
  }
}

String _$meterReadingServiceHash() =>
    r'd87292c70d9901e2aec8929cd873d2855dddf97e';
