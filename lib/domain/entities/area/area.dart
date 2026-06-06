import 'package:freezed_annotation/freezed_annotation.dart';

part 'area.freezed.dart';
part 'area.g.dart';

@freezed
sealed class Area with _$Area {
  const factory Area({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String companyId,
    required String name,
    @Default(0) int customerCount,
  }) = _Area;

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);
}
