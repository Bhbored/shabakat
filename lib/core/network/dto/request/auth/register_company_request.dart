import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_company_request.freezed.dart';
part 'register_company_request.g.dart';

@freezed
sealed class RegisterCompanyRequest with _$RegisterCompanyRequest {
  const factory RegisterCompanyRequest({
    required String companyName,
    required String email,
    required String password,
    required String confirmPassword,
    String? phone,
    String? logoUrl,
  }) = _RegisterCompanyRequest;

  factory RegisterCompanyRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterCompanyRequestFromJson(json);
}
