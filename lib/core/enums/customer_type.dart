import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(alwaysCreate: true)
enum CustomerType { residential, commercial, industrial }

extension CustomerTypeX on CustomerType {
  String get label => switch (this) {
    CustomerType.residential => 'Residential',
    CustomerType.commercial => 'Commercial',
    CustomerType.industrial => 'Industrial',
  };
}
