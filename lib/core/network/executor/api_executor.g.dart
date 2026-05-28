// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_executor.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(apiExecutor)
final apiExecutorProvider = ApiExecutorFamily._();

final class ApiExecutorProvider
    extends $FunctionalProvider<ApiExecutor, ApiExecutor, ApiExecutor>
    with $Provider<ApiExecutor> {
  ApiExecutorProvider._({
    required ApiExecutorFamily super.from,
    required Dio super.argument,
  }) : super(
         retry: null,
         name: r'apiExecutorProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$apiExecutorHash();

  @override
  String toString() {
    return r'apiExecutorProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ApiExecutor> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ApiExecutor create(Ref ref) {
    final argument = this.argument as Dio;
    return apiExecutor(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiExecutor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiExecutor>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ApiExecutorProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$apiExecutorHash() => r'ffd2bc6d44c60be46fc5ea56d6184c1f02f9fd3c';

final class ApiExecutorFamily extends $Family
    with $FunctionalFamilyOverride<ApiExecutor, Dio> {
  ApiExecutorFamily._()
    : super(
        retry: null,
        name: r'apiExecutorProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ApiExecutorProvider call(Dio dio) =>
      ApiExecutorProvider._(argument: dio, from: this);

  @override
  String toString() => r'apiExecutorProvider';
}
