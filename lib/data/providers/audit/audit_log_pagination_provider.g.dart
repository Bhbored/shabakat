// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_log_pagination_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuditLogPaginationNotifier)
final auditLogPaginationProvider = AuditLogPaginationNotifierProvider._();

final class AuditLogPaginationNotifierProvider
    extends $NotifierProvider<AuditLogPaginationNotifier, AuditLogPagination> {
  AuditLogPaginationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'auditLogPaginationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$auditLogPaginationNotifierHash();

  @$internal
  @override
  AuditLogPaginationNotifier create() => AuditLogPaginationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuditLogPagination value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuditLogPagination>(value),
    );
  }
}

String _$auditLogPaginationNotifierHash() =>
    r'9bfeb385983acd146cba7b255b002931fe3a2736';

abstract class _$AuditLogPaginationNotifier
    extends $Notifier<AuditLogPagination> {
  AuditLogPagination build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AuditLogPagination, AuditLogPagination>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuditLogPagination, AuditLogPagination>,
              AuditLogPagination,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
