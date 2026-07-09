import 'package:freezed_annotation/freezed_annotation.dart';

part 'distribution_box.freezed.dart';
part 'distribution_box.g.dart';

@freezed
sealed class DistributionBox with _$DistributionBox {
  const factory DistributionBox({
    required String id,
    required String name,
    required String areaId,
    required String areaName,
    String? locationNote,
    String? notes,
    @Default(0) int customerCount,
    required DateTime createdAt,
  }) = _DistributionBox;

  factory DistributionBox.fromJson(Map<String, dynamic> json) =>
      _$DistributionBoxFromJson(json);
}
