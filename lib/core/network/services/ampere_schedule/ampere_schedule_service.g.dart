// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ampere_schedule_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ampereScheduleService)
final ampereScheduleServiceProvider = AmpereScheduleServiceProvider._();

final class AmpereScheduleServiceProvider
    extends
        $FunctionalProvider<
          AmpereScheduleService,
          AmpereScheduleService,
          AmpereScheduleService
        >
    with $Provider<AmpereScheduleService> {
  AmpereScheduleServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'ampereScheduleServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ampereScheduleServiceHash();

  @$internal
  @override
  $ProviderElement<AmpereScheduleService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AmpereScheduleService create(Ref ref) {
    return ampereScheduleService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AmpereScheduleService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AmpereScheduleService>(value),
    );
  }
}

String _$ampereScheduleServiceHash() =>
    r'9c1fc325b17ff82b7c84ef4d7e96886f83772d84';
