import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_journal_depreciation.freezed.dart';
part 'asset_journal_depreciation.g.dart';

@freezed
class AssetJournalDepreciation with _$AssetJournalDepreciation {
  factory AssetJournalDepreciation({
    required int id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'period_start', fromJson: isoDateToDateTime)
    required DateTime periodStart,
    @JsonKey(name: 'period_end', fromJson: isoDateToDateTime)
    required DateTime periodEnd,
    @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
    required DateTime transactionDate,
    @JsonKey(name: 'transaction_id') required String transactionId,
    required int debit,
    required int credit,
  }) = _AssetJournalDepreciation;
  const AssetJournalDepreciation._();

  factory AssetJournalDepreciation.empty() {
    return AssetJournalDepreciation(
      id: 0,
      createdAt: DateTime(0),
      createdById: 0,
      periodStart: DateTime(0),
      periodEnd: DateTime(0),
      transactionDate: DateTime(0),
      transactionId: '',
      debit: 0,
      credit: 0,
    );
  }

  factory AssetJournalDepreciation.fromJson(Map<String, dynamic> json) =>
      _$AssetJournalDepreciationFromJson(json);
}
