// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_routine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionRoutineImpl _$$TransactionRoutineImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionRoutineImpl(
      isoDateToDateTime(json['created_at'] as String?),
      (json['created_by_id'] as num).toInt(),
      isoDateToDateTime(json['updated_at'] as String?),
      (json['updated_by_id'] as num).toInt(),
      (json['id'] as num).toInt(),
      json['title'] as String,
      json['chart_of_account_id'] as String,
      json['unique'] as String,
      (json['value'] as num).toDouble(),
      TransactionRoutineDk.fromString(json['dk'] as String),
      json['code'] as String,
      json['is_auto'] as bool? ?? false,
      json['minute'] as String,
      json['hour'] as String,
      json['day_month'] as String,
      json['month'] as String,
      json['day_week'] as String,
      json['is_active'] as bool? ?? false,
      isoDateToDateTime(json['last_active_date'] as String?),
      Department.fromJson(json['department_id'] as Map<String, dynamic>),
      json['material_id'] as String,
      json['description'] as String,
      json['reference'] as String,
    );

Map<String, dynamic> _$$TransactionRoutineImplToJson(
        _$TransactionRoutineImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updatedById,
      'id': instance.id,
      'title': instance.title,
      'chart_of_account_id': instance.chartOfAccountNo,
      'unique': instance.unique,
      'value': instance.value,
      'dk': _$TransactionRoutineDkEnumMap[instance.dk]!,
      'code': instance.code,
      'is_auto': instance.isAuto,
      'minute': instance.minute,
      'hour': instance.hour,
      'day_month': instance.dayMonth,
      'month': instance.month,
      'day_week': instance.dayWeek,
      'is_active': instance.isActive,
      'last_active_date': instance.lastActiveDate.toIso8601String(),
      'department_id': instance.department,
      'material_id': instance.materialId,
      'description': instance.description,
      'reference': instance.reference,
    };

const _$TransactionRoutineDkEnumMap = {
  TransactionRoutineDk.kredit: 'kredit',
  TransactionRoutineDk.debit: 'debit',
};
