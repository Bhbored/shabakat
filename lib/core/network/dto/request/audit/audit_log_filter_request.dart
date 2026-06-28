import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shabakat/core/enums/enums.dart';

part 'audit_log_filter_request.freezed.dart';
part 'audit_log_filter_request.g.dart';

String? _dateOnlyToJson(DateTime? date) => date != null
    ? '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}'
    : null;

DateTime? _dateOnlyFromJson(String? date) =>
    date != null ? DateTime.parse(date) : null;

@freezed
sealed class AuditLogFilterRequest with _$AuditLogFilterRequest {
  const factory AuditLogFilterRequest({
    AuditAction? action,
    AuditLogStatus? status,
    @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)
    DateTime? createdFrom,
    @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)
    DateTime? createdTo,
    @Default(1) int pageNumber,
    @Default(20) int pageSize,
  }) = _AuditLogFilterRequest;

  factory AuditLogFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$AuditLogFilterRequestFromJson(json);
}
