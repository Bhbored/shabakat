import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.freezed.dart';
part 'company.g.dart';

@freezed
sealed class Company with _$Company {
  const factory Company({
    required String id,
    String? email,
    String? phoneNumber,
    @Default(false) bool isBanned,
    required String companyName,
    String? logoUrl,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}
