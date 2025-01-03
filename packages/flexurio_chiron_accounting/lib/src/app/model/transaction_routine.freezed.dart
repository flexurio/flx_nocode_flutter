// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_routine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionRoutine _$TransactionRoutineFromJson(Map<String, dynamic> json) {
  return _TransactionRoutine.fromJson(json);
}

/// @nodoc
mixin _$TransactionRoutine {
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'chart_of_account_id')
  String get chartOfAccountNo => throw _privateConstructorUsedError;
  String get unique => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'dk', fromJson: TransactionRoutineDk.fromString)
  TransactionRoutineDk get dk => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_auto', defaultValue: false)
  bool get isAuto => throw _privateConstructorUsedError;
  String get minute => throw _privateConstructorUsedError;
  String get hour => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_month')
  String get dayMonth => throw _privateConstructorUsedError;
  String get month => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_week')
  String get dayWeek => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', defaultValue: false)
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_active_date', fromJson: isoDateToDateTime)
  DateTime get lastActiveDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_id', fromJson: Department.fromJson)
  Department get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_id')
  String get materialId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get reference => throw _privateConstructorUsedError;

  /// Serializes this TransactionRoutine to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionRoutine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionRoutineCopyWith<TransactionRoutine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionRoutineCopyWith<$Res> {
  factory $TransactionRoutineCopyWith(
          TransactionRoutine value, $Res Function(TransactionRoutine) then) =
      _$TransactionRoutineCopyWithImpl<$Res, TransactionRoutine>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      int id,
      String title,
      @JsonKey(name: 'chart_of_account_id') String chartOfAccountNo,
      String unique,
      double value,
      @JsonKey(name: 'dk', fromJson: TransactionRoutineDk.fromString)
      TransactionRoutineDk dk,
      String code,
      @JsonKey(name: 'is_auto', defaultValue: false) bool isAuto,
      String minute,
      String hour,
      @JsonKey(name: 'day_month') String dayMonth,
      String month,
      @JsonKey(name: 'day_week') String dayWeek,
      @JsonKey(name: 'is_active', defaultValue: false) bool isActive,
      @JsonKey(name: 'last_active_date', fromJson: isoDateToDateTime)
      DateTime lastActiveDate,
      @JsonKey(name: 'department_id', fromJson: Department.fromJson)
      Department department,
      @JsonKey(name: 'material_id') String materialId,
      String description,
      String reference});

  $DepartmentCopyWith<$Res> get department;
}

/// @nodoc
class _$TransactionRoutineCopyWithImpl<$Res, $Val extends TransactionRoutine>
    implements $TransactionRoutineCopyWith<$Res> {
  _$TransactionRoutineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionRoutine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? id = null,
    Object? title = null,
    Object? chartOfAccountNo = null,
    Object? unique = null,
    Object? value = null,
    Object? dk = null,
    Object? code = null,
    Object? isAuto = null,
    Object? minute = null,
    Object? hour = null,
    Object? dayMonth = null,
    Object? month = null,
    Object? dayWeek = null,
    Object? isActive = null,
    Object? lastActiveDate = null,
    Object? department = null,
    Object? materialId = null,
    Object? description = null,
    Object? reference = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      chartOfAccountNo: null == chartOfAccountNo
          ? _value.chartOfAccountNo
          : chartOfAccountNo // ignore: cast_nullable_to_non_nullable
              as String,
      unique: null == unique
          ? _value.unique
          : unique // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      dk: null == dk
          ? _value.dk
          : dk // ignore: cast_nullable_to_non_nullable
              as TransactionRoutineDk,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      isAuto: null == isAuto
          ? _value.isAuto
          : isAuto // ignore: cast_nullable_to_non_nullable
              as bool,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as String,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as String,
      dayMonth: null == dayMonth
          ? _value.dayMonth
          : dayMonth // ignore: cast_nullable_to_non_nullable
              as String,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      dayWeek: null == dayWeek
          ? _value.dayWeek
          : dayWeek // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      lastActiveDate: null == lastActiveDate
          ? _value.lastActiveDate
          : lastActiveDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      materialId: null == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of TransactionRoutine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DepartmentCopyWith<$Res> get department {
    return $DepartmentCopyWith<$Res>(_value.department, (value) {
      return _then(_value.copyWith(department: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionRoutineImplCopyWith<$Res>
    implements $TransactionRoutineCopyWith<$Res> {
  factory _$$TransactionRoutineImplCopyWith(_$TransactionRoutineImpl value,
          $Res Function(_$TransactionRoutineImpl) then) =
      __$$TransactionRoutineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      int id,
      String title,
      @JsonKey(name: 'chart_of_account_id') String chartOfAccountNo,
      String unique,
      double value,
      @JsonKey(name: 'dk', fromJson: TransactionRoutineDk.fromString)
      TransactionRoutineDk dk,
      String code,
      @JsonKey(name: 'is_auto', defaultValue: false) bool isAuto,
      String minute,
      String hour,
      @JsonKey(name: 'day_month') String dayMonth,
      String month,
      @JsonKey(name: 'day_week') String dayWeek,
      @JsonKey(name: 'is_active', defaultValue: false) bool isActive,
      @JsonKey(name: 'last_active_date', fromJson: isoDateToDateTime)
      DateTime lastActiveDate,
      @JsonKey(name: 'department_id', fromJson: Department.fromJson)
      Department department,
      @JsonKey(name: 'material_id') String materialId,
      String description,
      String reference});

  @override
  $DepartmentCopyWith<$Res> get department;
}

/// @nodoc
class __$$TransactionRoutineImplCopyWithImpl<$Res>
    extends _$TransactionRoutineCopyWithImpl<$Res, _$TransactionRoutineImpl>
    implements _$$TransactionRoutineImplCopyWith<$Res> {
  __$$TransactionRoutineImplCopyWithImpl(_$TransactionRoutineImpl _value,
      $Res Function(_$TransactionRoutineImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionRoutine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? id = null,
    Object? title = null,
    Object? chartOfAccountNo = null,
    Object? unique = null,
    Object? value = null,
    Object? dk = null,
    Object? code = null,
    Object? isAuto = null,
    Object? minute = null,
    Object? hour = null,
    Object? dayMonth = null,
    Object? month = null,
    Object? dayWeek = null,
    Object? isActive = null,
    Object? lastActiveDate = null,
    Object? department = null,
    Object? materialId = null,
    Object? description = null,
    Object? reference = null,
  }) {
    return _then(_$TransactionRoutineImpl(
      null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      null == chartOfAccountNo
          ? _value.chartOfAccountNo
          : chartOfAccountNo // ignore: cast_nullable_to_non_nullable
              as String,
      null == unique
          ? _value.unique
          : unique // ignore: cast_nullable_to_non_nullable
              as String,
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      null == dk
          ? _value.dk
          : dk // ignore: cast_nullable_to_non_nullable
              as TransactionRoutineDk,
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      null == isAuto
          ? _value.isAuto
          : isAuto // ignore: cast_nullable_to_non_nullable
              as bool,
      null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as String,
      null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as String,
      null == dayMonth
          ? _value.dayMonth
          : dayMonth // ignore: cast_nullable_to_non_nullable
              as String,
      null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      null == dayWeek
          ? _value.dayWeek
          : dayWeek // ignore: cast_nullable_to_non_nullable
              as String,
      null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      null == lastActiveDate
          ? _value.lastActiveDate
          : lastActiveDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      null == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String,
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionRoutineImpl extends _TransactionRoutine {
  _$TransactionRoutineImpl(
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) this.createdAt,
      @JsonKey(name: 'created_by_id') this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) this.updatedAt,
      @JsonKey(name: 'updated_by_id') this.updatedById,
      this.id,
      this.title,
      @JsonKey(name: 'chart_of_account_id') this.chartOfAccountNo,
      this.unique,
      this.value,
      @JsonKey(name: 'dk', fromJson: TransactionRoutineDk.fromString) this.dk,
      this.code,
      @JsonKey(name: 'is_auto', defaultValue: false) this.isAuto,
      this.minute,
      this.hour,
      @JsonKey(name: 'day_month') this.dayMonth,
      this.month,
      @JsonKey(name: 'day_week') this.dayWeek,
      @JsonKey(name: 'is_active', defaultValue: false) this.isActive,
      @JsonKey(name: 'last_active_date', fromJson: isoDateToDateTime)
      this.lastActiveDate,
      @JsonKey(name: 'department_id', fromJson: Department.fromJson)
      this.department,
      @JsonKey(name: 'material_id') this.materialId,
      this.description,
      this.reference)
      : super._();

  factory _$TransactionRoutineImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionRoutineImplFromJson(json);

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updatedById;
  @override
  final int id;
  @override
  final String title;
  @override
  @JsonKey(name: 'chart_of_account_id')
  final String chartOfAccountNo;
  @override
  final String unique;
  @override
  final double value;
  @override
  @JsonKey(name: 'dk', fromJson: TransactionRoutineDk.fromString)
  final TransactionRoutineDk dk;
  @override
  final String code;
  @override
  @JsonKey(name: 'is_auto', defaultValue: false)
  final bool isAuto;
  @override
  final String minute;
  @override
  final String hour;
  @override
  @JsonKey(name: 'day_month')
  final String dayMonth;
  @override
  final String month;
  @override
  @JsonKey(name: 'day_week')
  final String dayWeek;
  @override
  @JsonKey(name: 'is_active', defaultValue: false)
  final bool isActive;
  @override
  @JsonKey(name: 'last_active_date', fromJson: isoDateToDateTime)
  final DateTime lastActiveDate;
  @override
  @JsonKey(name: 'department_id', fromJson: Department.fromJson)
  final Department department;
  @override
  @JsonKey(name: 'material_id')
  final String materialId;
  @override
  final String description;
  @override
  final String reference;

  @override
  String toString() {
    return 'TransactionRoutine(createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updatedById: $updatedById, id: $id, title: $title, chartOfAccountNo: $chartOfAccountNo, unique: $unique, value: $value, dk: $dk, code: $code, isAuto: $isAuto, minute: $minute, hour: $hour, dayMonth: $dayMonth, month: $month, dayWeek: $dayWeek, isActive: $isActive, lastActiveDate: $lastActiveDate, department: $department, materialId: $materialId, description: $description, reference: $reference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionRoutineImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.chartOfAccountNo, chartOfAccountNo) ||
                other.chartOfAccountNo == chartOfAccountNo) &&
            (identical(other.unique, unique) || other.unique == unique) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.dk, dk) || other.dk == dk) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.isAuto, isAuto) || other.isAuto == isAuto) &&
            (identical(other.minute, minute) || other.minute == minute) &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.dayMonth, dayMonth) ||
                other.dayMonth == dayMonth) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.dayWeek, dayWeek) || other.dayWeek == dayWeek) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.lastActiveDate, lastActiveDate) ||
                other.lastActiveDate == lastActiveDate) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.materialId, materialId) ||
                other.materialId == materialId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.reference, reference) ||
                other.reference == reference));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        createdAt,
        createdById,
        updatedAt,
        updatedById,
        id,
        title,
        chartOfAccountNo,
        unique,
        value,
        dk,
        code,
        isAuto,
        minute,
        hour,
        dayMonth,
        month,
        dayWeek,
        isActive,
        lastActiveDate,
        department,
        materialId,
        description,
        reference
      ]);

  /// Create a copy of TransactionRoutine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionRoutineImplCopyWith<_$TransactionRoutineImpl> get copyWith =>
      __$$TransactionRoutineImplCopyWithImpl<_$TransactionRoutineImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionRoutineImplToJson(
      this,
    );
  }
}

abstract class _TransactionRoutine extends TransactionRoutine {
  factory _TransactionRoutine(
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      final DateTime createdAt,
      @JsonKey(name: 'created_by_id') final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') final int updatedById,
      final int id,
      final String title,
      @JsonKey(name: 'chart_of_account_id') final String chartOfAccountNo,
      final String unique,
      final double value,
      @JsonKey(name: 'dk', fromJson: TransactionRoutineDk.fromString)
      final TransactionRoutineDk dk,
      final String code,
      @JsonKey(name: 'is_auto', defaultValue: false) final bool isAuto,
      final String minute,
      final String hour,
      @JsonKey(name: 'day_month') final String dayMonth,
      final String month,
      @JsonKey(name: 'day_week') final String dayWeek,
      @JsonKey(name: 'is_active', defaultValue: false) final bool isActive,
      @JsonKey(name: 'last_active_date', fromJson: isoDateToDateTime)
      final DateTime lastActiveDate,
      @JsonKey(name: 'department_id', fromJson: Department.fromJson)
      final Department department,
      @JsonKey(name: 'material_id') final String materialId,
      final String description,
      final String reference) = _$TransactionRoutineImpl;
  _TransactionRoutine._() : super._();

  factory _TransactionRoutine.fromJson(Map<String, dynamic> json) =
      _$TransactionRoutineImpl.fromJson;

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updatedById;
  @override
  int get id;
  @override
  String get title;
  @override
  @JsonKey(name: 'chart_of_account_id')
  String get chartOfAccountNo;
  @override
  String get unique;
  @override
  double get value;
  @override
  @JsonKey(name: 'dk', fromJson: TransactionRoutineDk.fromString)
  TransactionRoutineDk get dk;
  @override
  String get code;
  @override
  @JsonKey(name: 'is_auto', defaultValue: false)
  bool get isAuto;
  @override
  String get minute;
  @override
  String get hour;
  @override
  @JsonKey(name: 'day_month')
  String get dayMonth;
  @override
  String get month;
  @override
  @JsonKey(name: 'day_week')
  String get dayWeek;
  @override
  @JsonKey(name: 'is_active', defaultValue: false)
  bool get isActive;
  @override
  @JsonKey(name: 'last_active_date', fromJson: isoDateToDateTime)
  DateTime get lastActiveDate;
  @override
  @JsonKey(name: 'department_id', fromJson: Department.fromJson)
  Department get department;
  @override
  @JsonKey(name: 'material_id')
  String get materialId;
  @override
  String get description;
  @override
  String get reference;

  /// Create a copy of TransactionRoutine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionRoutineImplCopyWith<_$TransactionRoutineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
