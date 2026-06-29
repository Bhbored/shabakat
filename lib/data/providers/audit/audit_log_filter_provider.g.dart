// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_log_filter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuditLogFilterNotifier)
final auditLogFilterProvider = AuditLogFilterNotifierProvider._();

final class AuditLogFilterNotifierProvider
    extends $NotifierProvider<AuditLogFilterNotifier, AuditLogFilterRequest> {
  AuditLogFilterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'auditLogFilterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$auditLogFilterNotifierHash();

  @$internal
  @override
  AuditLogFilterNotifier create() => AuditLogFilterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuditLogFilterRequest value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuditLogFilterRequest>(value),
    );
  }
}

String _$auditLogFilterNotifierHash() =>
    r'8aed656aa809e774463504af9e38ebde78de1a2c';

abstract class _$AuditLogFilterNotifier
    extends $Notifier<AuditLogFilterRequest> {
  AuditLogFilterRequest build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AuditLogFilterRequest, AuditLogFilterRequest>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuditLogFilterRequest, AuditLogFilterRequest>,
              AuditLogFilterRequest,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
