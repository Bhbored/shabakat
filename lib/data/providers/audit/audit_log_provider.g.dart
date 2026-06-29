// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_log_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuditLogNotifier)
final auditLogProvider = AuditLogNotifierProvider._();

final class AuditLogNotifierProvider
    extends $AsyncNotifierProvider<AuditLogNotifier, List<AuditLog>> {
  AuditLogNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: retry,
        name: r'auditLogProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$auditLogNotifierHash();

  @$internal
  @override
  AuditLogNotifier create() => AuditLogNotifier();
}

String _$auditLogNotifierHash() => r'c59ce48b57077995a69ada17fe803bc22422d29d';

abstract class _$AuditLogNotifier extends $AsyncNotifier<List<AuditLog>> {
  FutureOr<List<AuditLog>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<AuditLog>>, List<AuditLog>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<AuditLog>>, List<AuditLog>>,
              AsyncValue<List<AuditLog>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
