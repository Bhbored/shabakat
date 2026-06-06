import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.freezed.dart';
part 'company.g.dart';

@freezed
sealed class Company with _$Company {
  const factory Company({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String name,
    String? logoUrl,
    @Default(false) bool isBanned,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}
