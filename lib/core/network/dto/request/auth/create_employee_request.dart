import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_employee_request.freezed.dart';
part 'create_employee_request.g.dart';

@freezed
sealed class CreateEmployeeRequest with _$CreateEmployeeRequest {
  const factory CreateEmployeeRequest({
    required String fullName,
    required String email,
    required String password,
  }) = _CreateEmployeeRequest;

  factory CreateEmployeeRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateEmployeeRequestFromJson(json);
}
