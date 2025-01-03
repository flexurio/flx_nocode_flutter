import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_of_account_number.freezed.dart';
part 'chart_of_account_number.g.dart';

enum ChartOfAccountNumberStatus implements ColorType {
  empty('', '', Colors.transparent),
  journal('JOURNAL', 'Journal', Colors.green),
  nonJournal('NON JOURNAL', 'Non Journal', Colors.indigo),
  zero('0', 'Non Journal', Colors.pink),
  one('1', 'Journal', Colors.blueAccent);

  const ChartOfAccountNumberStatus(this.id, this.label, this.color);

  final String id;

  @override
  final String label;

  @override
  final Color color;

  static List<ChartOfAccountNumberStatus> get list => [
        ChartOfAccountNumberStatus.journal,
        ChartOfAccountNumberStatus.nonJournal,
      ];

  static ChartOfAccountNumberStatus fromString(String id) {
    if (id == ChartOfAccountNumberStatus.journal.id) {
      return ChartOfAccountNumberStatus.journal;
    }
    if (id == ChartOfAccountNumberStatus.nonJournal.id) {
      return ChartOfAccountNumberStatus.nonJournal;
    }
    if (id == ChartOfAccountNumberStatus.zero.id) {
      return ChartOfAccountNumberStatus.zero;
    }
    if (id == ChartOfAccountNumberStatus.one.id) {
      return ChartOfAccountNumberStatus.one;
    }
    return ChartOfAccountNumberStatus.empty;
  }
}

@freezed
class ChartOfAccountNumber with _$ChartOfAccountNumber {
  factory ChartOfAccountNumber(
    String id,
    String name,
    @JsonKey(name: 'is_factory_overhead', defaultValue: false)
    bool isFactoryOverhead,
    @JsonKey(name: 'status', fromJson: ChartOfAccountNumberStatus.fromString)
    ChartOfAccountNumberStatus status,
    @JsonKey(name: 'chart_of_account_group')
    ChartOfAccountGroup chartOfAccountGroup,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    DateTime createdAt,
    @JsonKey(name: 'created_by_id') int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') int updateById,
  ) = _ChartOfAccountNumber;
  const ChartOfAccountNumber._();

  factory ChartOfAccountNumber.fromJson(Map<String, dynamic> json) =>
      _$ChartOfAccountNumberFromJson(json);

  factory ChartOfAccountNumber.empty() => ChartOfAccountNumber(
        '',
        '',
        false,
        ChartOfAccountNumberStatus.empty,
        ChartOfAccountGroup.empty(),
        DateTime.now(),
        0,
        DateTime.now(),
        0,
      );
}
