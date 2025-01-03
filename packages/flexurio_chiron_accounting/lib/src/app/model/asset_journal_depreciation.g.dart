// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_journal_depreciation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssetJournalDepreciationImpl _$$AssetJournalDepreciationImplFromJson(
        Map<String, dynamic> json) =>
    _$AssetJournalDepreciationImpl(
      id: (json['id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      periodStart: isoDateToDateTime(json['period_start'] as String?),
      periodEnd: isoDateToDateTime(json['period_end'] as String?),
      transactionDate: isoDateToDateTime(json['transaction_date'] as String?),
      transactionId: json['transaction_id'] as String,
      debit: (json['debit'] as num).toInt(),
      credit: (json['credit'] as num).toInt(),
    );

Map<String, dynamic> _$$AssetJournalDepreciationImplToJson(
        _$AssetJournalDepreciationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'period_start': instance.periodStart.toIso8601String(),
      'period_end': instance.periodEnd.toIso8601String(),
      'transaction_date': instance.transactionDate.toIso8601String(),
      'transaction_id': instance.transactionId,
      'debit': instance.debit,
      'credit': instance.credit,
    };
