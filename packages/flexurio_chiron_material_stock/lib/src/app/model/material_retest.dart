import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart' as ui;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_retest.freezed.dart';
part 'material_retest.g.dart';

enum MaterialRetestStatus implements ColorType {
  empty('', ui.Colors.transparent),
  release('RELEASE', ui.Colors.green),
  retest('RETEST', ui.Colors.grey),
  reject('REJECT', ui.Colors.red);

  const MaterialRetestStatus(this.label, this.color);

  @override
  final String label;

  @override
  final ui.Color color;

  static MaterialRetestStatus fromString(String id) {
    if (id == MaterialRetestStatus.empty.label) {
      return MaterialRetestStatus.empty;
    }
    if (id == MaterialRetestStatus.release.label) {
      return MaterialRetestStatus.release;
    }
    if (id == MaterialRetestStatus.reject.label) {
      return MaterialRetestStatus.reject;
    }
    if (id == MaterialRetestStatus.retest.label) {
      return MaterialRetestStatus.retest;
    }
    throw ArgumentError();
  }
}

@freezed
class MaterialRetest with _$MaterialRetest {
  const factory MaterialRetest({
    required int id,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_by_id') required int updateById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    required Material material,
    @JsonKey(name: 'material_group') required MaterialGroup materialGroup,
    @JsonKey(name: 'retest_date', fromJson: isoDateToDateTime)
    required DateTime retestDate,
    required String na,
    @JsonKey(name: 'status', fromJson: MaterialRetestStatus.fromString)
    required MaterialRetestStatus status,
    @JsonKey(name: 'quantity_retest') required int quantityRetest,
    @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
    required DateTime expiredDate,
  }) = _MaterialRetests;

  const MaterialRetest._();

  factory MaterialRetest.fromJson(Map<String, Object?> json) =>
      _$MaterialRetestFromJson(json);
}
