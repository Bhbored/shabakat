// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_log_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(auditLogService)
final auditLogServiceProvider = AuditLogServiceProvider._();

final class AuditLogServiceProvider
    extends
        $FunctionalProvider<AuditLogService, AuditLogService, AuditLogService>
    with $Provider<AuditLogService> {
  AuditLogServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'auditLogServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$auditLogServiceHash();

  @$internal
  @override
  $ProviderElement<AuditLogService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuditLogService create(Ref ref) {
    return auditLogService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuditLogService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuditLogService>(value),
    );
  }
}

String _$auditLogServiceHash() => r'4e2b2d0cd182144ac0c7997e599f28753122023e';
